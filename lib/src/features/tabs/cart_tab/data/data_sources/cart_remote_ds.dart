import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/data/models/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<CartResponseModel> getAllCart();
  Future<CartResponseModel> addToCart(String productId);
  Future<CartResponseModel> updatedProductQuantity(String productId, int count);
  Future<CartResponseModel> removeFromCart(String productId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  @override
  Future<CartResponseModel> getAllCart() async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.get,
      path: ApiConstants.cart,
    );
    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          CartResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }

  @override
  Future<CartResponseModel> addToCart(String productId) async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.post,
      path: ApiConstants.cart,
      body: {'productId': productId},
    );
    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          CartResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }

  @override
  Future<CartResponseModel> updatedProductQuantity(
    String productId,
    int count,
  ) async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.put,
      path: '${ApiConstants.cart}/$productId',
      body: {'count': count},
    );
    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          CartResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }
  
  @override
  Future<CartResponseModel> removeFromCart(String productId) async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.delete,
      path: '${ApiConstants.cart}/$productId',
    );
    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          CartResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }
}
