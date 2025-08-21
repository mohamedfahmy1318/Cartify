import 'dart:io';

import 'package:dio/dio.dart';
import 'package:full_ecommerce_app/src/config/language/languages.dart';
import 'package:full_ecommerce_app/src/core/network/backend_configuation.dart';

class ConfigurationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      HttpHeaders.acceptHeader: ContentType.json,
      Headers.contentTypeHeader: Headers.jsonContentType,
      HttpHeaders.acceptLanguageHeader:
          Languages.currentLanguage.locale.languageCode,
    });
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (BackendConfiguration.type.isPhp) {
      _handleError(response);
    }
    handler.next(response);
  }

  void _handleError(Response response) {
    final responseData = response.data;

    // Only process if response.data is a Map and contains error indicators
    if (responseData is! Map<String, dynamic>) {
      return;
    }

    final errorKey = responseData['key'];
    final errorMessage = responseData['msg'];

    // Only handle as error if we have an error key
    if (errorKey == null) {
      return;
    }

    final statusCode = _mapErrorKeyToStatusCode(errorKey);

    if (statusCode != null) {
      throw DioException(
        type: DioExceptionType.badResponse,
        requestOptions: response.requestOptions,
        response: Response(
          requestOptions: response.requestOptions,
          data: {'message': errorMessage},
          statusCode: statusCode,
        ),
        error: {'message': errorMessage},
      );
    }
  }

  // bool isNeedApproval(String key) {
  //   if (key == 'needApproval') {
  //     UserCubit.instance.setUserStatus(UserStatus.needApproval);
  //   }
  //   UserCubit.instance.setUserStatus(UserStatus.needApproval);
  //   return false;
  // }

  int? _mapErrorKeyToStatusCode(String errorKey) {
    switch (errorKey) {
      case 'fail':
        return HttpStatus.badRequest;
      case 'unauthenticated':
        return HttpStatus.unauthorized;
      case 'blocked':
        return HttpStatus.locked;
      case 'exception':
        return HttpStatus.internalServerError;
      case 'needActive':
        return HttpStatus.forbidden;
      default:
        return null;
    }
  }
}
