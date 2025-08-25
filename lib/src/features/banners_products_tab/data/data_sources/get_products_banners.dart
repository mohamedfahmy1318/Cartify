import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/products_banner_response_model.dart';

abstract class GetProductsBannersDataSource {
  Future<ProductsBannerResponseModel> getProductsBanners(
    String brand, {
    int? page,
    int? limit,
  });
}

class GetProductsBannersDataSourceImpl implements GetProductsBannersDataSource {
  @override
  Future<ProductsBannerResponseModel> getProductsBanners(
    String brand, {
    int? page,
    int? limit,
  }) async {
    Map<String, dynamic>? queryParameters;
    queryParameters = {};
    queryParameters['brand'] = brand;
    if (page != null) {
      queryParameters['page'] = page;
    }
    if (limit != null) {
      queryParameters['limit'] = limit;
    }

    // Make the API call with the query parameters
    final networkRequest = NetworkRequest(
      method: RequestMethod.get,
      path: ApiConstants.getProducts,
      queryParameters: queryParameters,
    );

    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          ProductsBannerResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }
}
