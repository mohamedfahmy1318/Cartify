import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/adderss_response_model.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';

abstract class AddressRemoteDataSource {
  Future<AddressResponseModel> getAllAddress();
  Future<AddressResponseModel> addAddress(AddressRequest address);
  //Future<AddressResponseModel> updateAddress(AddressModel address);
  // Future<AddressResponseModel> deleteAddress(String id);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  @override
  //getAllAddress Method
  Future<AddressResponseModel> getAllAddress() async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.get,
      path: ApiConstants.addresses,
    );
    final response = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          AddressResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return response.data;
  }
  
  @override
  Future<AddressResponseModel> addAddress(AddressRequest address) async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: ApiConstants.addresses,
      body: address.toJson(),
    );
    final response = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          AddressResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return response.data;
  }
}
