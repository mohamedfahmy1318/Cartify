import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';
import 'package:full_ecommerce_app/src/features/auth/register/data/models/register_request_model.dart';

abstract class RegisterRemoteDataSource {
  Future<UserAuthResponse> register(RegisterRequestModel request);
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  @override
  Future<UserAuthResponse> register(RegisterRequestModel request) async {
    final NetworkRequest<RegisterRequestModel> networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: ApiConstants.signup,
      body: request.toJson(),
    );
    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) => UserAuthResponse.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }
}
