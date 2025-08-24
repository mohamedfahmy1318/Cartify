import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/models/category_moded.dart';

abstract class HomeTabRemoteDataSource {
  Future<List<CategoryModel>> getCategories({int? limit});
  //Future<List<BannerModel>> getBanners();
}

class HomeTabRemoteDataSourceImpl implements HomeTabRemoteDataSource {
  @override
  Future<List<CategoryModel>> getCategories({int? limit}) async {
    // Build query parameters
    Map<String, dynamic>? queryParameters;
    if (limit != null) {
      queryParameters = {'limit': limit.toString()};
    }

    final networkRequest = NetworkRequest(
      method: RequestMethod.get,
      path: ApiConstants.getAllCategories,
      queryParameters: queryParameters,
    );
    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          CategoryResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return result.data.data;
  }
}
