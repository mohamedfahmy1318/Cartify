import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';
import 'package:full_ecommerce_app/src/features/auth/login/data/models/login_request_model.dart';

abstract class LoginRemoteDataSource {
  Future<UserAuthResponse> login(LoginRequestModel request);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<UserAuthResponse> login(LoginRequestModel request) async {
    final NetworkRequest<LoginRequestModel> networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: ApiConstants.login,
      body: request.toJson(),
    );
    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) => UserAuthResponse.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }
}
