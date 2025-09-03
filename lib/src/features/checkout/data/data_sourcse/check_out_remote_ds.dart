import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/adderss_response_model.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/checkout_request_model.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/checkout_response_model.dart';

abstract class CheckoutRemoteDataSource {
  Future<AddressResponseModel> getAllAddress();
  Future<AddressResponseModel> addAddress(AddressRequest address);
  //Future<AddressResponseModel> updateAddress(AddressModel address);
  Future<AddressResponseModel> deleteAddress(String addressId);
  
  // Checkout methods
  Future<CheckoutResponseModel> createCashOrder(CheckoutRequestModel request);
}

class CheckoutRemoteDataSourceImpl implements CheckoutRemoteDataSource {
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
  
  @override
  Future<AddressResponseModel> deleteAddress(String addressId) async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.delete,
      path: '${ApiConstants.addresses}/$addressId',
    );
    final response = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) {
        // Handle different response formats for delete operation
        if (json is Map<String, dynamic>) {
          // If response is a map, try to parse it as AddressResponseModel
          return AddressResponseModel.fromJson(json);
        } else if (json is List<dynamic>) {
          // If response is a list, create a success response with empty data
          return const AddressResponseModel(
            results: 0,
            message: 'Address deleted successfully',
            data: [],
          );
        } else {
          // For other response types (string, null, etc.), create a success response
          return const AddressResponseModel(
            results: 0,
            message: 'Address deleted successfully',
            data: [],
          );
        }
      },
    );
    return response.data; 
  }

  @override
  Future<CheckoutResponseModel> createCashOrder(CheckoutRequestModel request) async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: '${ApiConstants.orders}/${request.cartId}',
      body: {
        'shippingAddress': request.shippingAddress.toJson(),
      },
    );
    final response = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) => CheckoutResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return response.data;
  }
}
