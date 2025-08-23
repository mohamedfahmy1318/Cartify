import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/forgot_password_response.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/pin_code_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/pin_code_response.dart';

abstract class ForgotPasswordRemoteDataSource {
  Future<ForgotPasswordResponse> forgotPassword(ForgotPasswordRequest request);
  Future<PinCodeResponse> pinCode(ResetCodeRequest request);
}

class ForgotPasswordRemoteDataSourceImpl
    implements ForgotPasswordRemoteDataSource {
  @override
  Future<ForgotPasswordResponse> forgotPassword(
    ForgotPasswordRequest forgotPasswordRequest,
  ) async {
    final NetworkRequest networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: ApiConstants.forgetPassword,
      body: forgotPasswordRequest.toJson(),
    );
    var result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (data) => ForgotPasswordResponse.fromJson(data),
    );
    return result.data;
  }

  @override
  Future<PinCodeResponse> pinCode(ResetCodeRequest resetCodeRequest) async {
    final NetworkRequest networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: ApiConstants.verifyCode,
      body: resetCodeRequest.toJson(),
    );
    var result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (data) => PinCodeResponse.fromJson(data),
    );
    return result.data;
  }
}
