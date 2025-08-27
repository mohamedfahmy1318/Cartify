import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/products_banner_model.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/data/models/fav_model_response.dart';

abstract class FavTabRemoteDataSource {
  Future<FavResponseModel> getFavoriteProducts();
  //Future<void> addProductToFavorites(String productId);
  //Future<void> removeProductFromFavorites(String productId);
}

class FavTabRemoteDataSourceImpl implements FavTabRemoteDataSource {
  @override
  Future<FavResponseModel> getFavoriteProducts() async {
    final NetworkRequest<List<ProductModel>> networkRequest = NetworkRequest(
      method: RequestMethod.get,
      path: ApiConstants.favorites,
    );

    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) => FavResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }
}
