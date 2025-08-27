import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/backend_configuation.dart';
import 'package:full_ecommerce_app/src/core/network/extensions.dart';
import 'package:full_ecommerce_app/src/core/shared/base_model.dart';

import '../../config/language/locale_keys.g.dart';
import '../error/exceptions.dart';
import 'configuration_interceptor.dart';
import 'log_interceptor.dart';
import 'network_request.dart';
import 'network_service.dart';

class DioService implements NetworkService {
  late final Dio _dio;

  DioService() {
    _initDio();
  }

  void _initDio() {
    _dio = Dio()
      ..options.baseUrl = ConstantManager.baseUrl
      ..options.connectTimeout = const Duration(
        seconds: ConstantManager.connectTimeoutDuration,
      )
      ..options.receiveTimeout = const Duration(
        seconds: ConstantManager.receiveTimeoutDuration,
      )
      ..options.responseType = ResponseType.json;

    if (BackendConfiguration.type.isPhp) {
      _dio.interceptors.add(ConfigurationInterceptor());
    }
    if (kDebugMode) {
      _dio.interceptors.add(LoggerInterceptor());
    }
    _dio.options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
  }

  @override
  void setToken(String token) {
    // Many APIs expect Authorization: Bearer <token>,
    // while Routemisr e-commerce API expects a 'token' header without Bearer.
    _dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    _dio.options.headers['token'] = token;
  }

  @override
  void removeToken() {
    _dio.options.headers.remove(HttpHeaders.authorizationHeader);
    _dio.options.headers.remove('token');
  }

  @override
  Future<BaseModel<Model>> callApi<Model>(
    NetworkRequest networkRequest, {
    Model Function(dynamic json)? mapper,
  }) async {
    try {
      await networkRequest.prepareRequestData();
      final response = await _dio.request(
        networkRequest.path,
        data: networkRequest.hasBodyAndProgress()
            ? networkRequest.isFormData
                  ? FormData.fromMap(networkRequest.body!)
                  : networkRequest.body
            : networkRequest.body,
        queryParameters: networkRequest.queryParameters,
        onSendProgress: networkRequest.hasBodyAndProgress()
            ? networkRequest.onSendProgress
            : null,
        onReceiveProgress: networkRequest.hasBodyAndProgress()
            ? networkRequest.onReceiveProgress
            : null,
        options: Options(
          method: networkRequest.asString(),
          headers: networkRequest.headers,
        ),
      );

      // Handle null response data
      if (response.data == null) {
        throw ServerException(LocaleKeys.serverError);
      }

      // Ensure response.data is a Map
      if (response.data is! Map<String, dynamic>) {
        throw ServerException(LocaleKeys.serverError);
      }

      if (mapper != null) {
        return BaseModel.fromJson(response.data, jsonToModel: mapper);
      } else {
        return BaseModel.fromJson(response.data);
      }
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  dynamic _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        throw NoInternetConnectionException(LocaleKeys.checkInternet);
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        final responseData = error.response?.data;
        final errorMessage = _extractErrorMessage(responseData);

        switch (statusCode) {
          case HttpStatus.badRequest:
            throw BadRequestException(errorMessage ?? LocaleKeys.badRequest);
          case HttpStatus.unauthorized:
            throw UnauthorizedException(
              errorMessage ?? LocaleKeys.unauthorized,
            );
          case HttpStatus.locked:
            throw BlockedException(errorMessage ?? LocaleKeys.unauthorized);
          case HttpStatus.notFound:
            throw NotFoundException(LocaleKeys.notFound);
          case HttpStatus.conflict:
            throw ConflictException(errorMessage ?? LocaleKeys.serverError);
          case HttpStatus.internalServerError:
            throw InternalServerErrorException(
              errorMessage ?? LocaleKeys.serverError,
            );
          default:
            throw ServerException(LocaleKeys.serverError);
        }
      case DioExceptionType.cancel:
        throw ServerException(LocaleKeys.intenetWeakness);
      case DioExceptionType.unknown:
        final errorMessage = _extractErrorMessage(error.response?.data);
        throw ServerException(errorMessage ?? LocaleKeys.exceptionError);
      default:
        final errorMessage = _extractErrorMessage(error.response?.data);
        throw ServerException(errorMessage ?? LocaleKeys.exceptionError);
    }
  }

  String? _extractErrorMessage(dynamic responseData) {
    if (responseData == null) return null;

    try {
      if (responseData is Map<String, dynamic>) {
        return responseData['message']?.toString() ??
            responseData['msg']?.toString() ??
            responseData['error']?.toString();
      } else if (responseData is String) {
        return responseData;
      }
    } catch (e) {
      // If we can't extract message, return null
      return null;
    }

    return null;
  }
}
