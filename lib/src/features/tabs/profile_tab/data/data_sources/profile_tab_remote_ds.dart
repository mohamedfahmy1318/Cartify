import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_model_response.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_request_model.dart';

abstract class ProfileTabRemoteDataSource {
  Future<PasswordUpdateResponseModel> updatePassword(
    PasswordRequestModel request,
  );
}

class ProfileTabRemoteDataSourceImpl implements ProfileTabRemoteDataSource {
  @override
  Future<PasswordUpdateResponseModel> updatePassword(
    PasswordRequestModel request,
  ) async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.put,
      path: ApiConstants.changePassword,
      body: request.toJson(),
    );
  
    final response = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          PasswordUpdateResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return response.data;
  }
}
