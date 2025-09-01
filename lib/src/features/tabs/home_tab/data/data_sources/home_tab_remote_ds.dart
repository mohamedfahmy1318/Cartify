import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/network/api_endpoints.dart';
import 'package:full_ecommerce_app/src/core/network/network_request.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/products_response_model.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/models/category_response.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/models/banner_response.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/models/sub_categor_resoinse.dart';

abstract class HomeTabRemoteDataSource {
  Future<List<CategoryModel>> getCategories({int? limit});
  Future<BannerResponse> getBanners({int? limit, int? page});
  Future<ProductsResponseModel> getProducts({
    int? limit,
    String? sort,
    int? page,
    String? categoryId, // للـ Category
    String? subCategoryId, // للـ SubCategory
  });
  Future<SubCategoryResponse> getSubCategoriesFromCategory(String categoryId);
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

  @override
  Future<BannerResponse> getBanners({int? limit, int? page}) async {
    // Check query parameters
    Map<String, dynamic>? queryParameters;
    if (limit != null || page != null) {
      queryParameters = {};
      if (limit != null) {
        queryParameters['limit'] = limit.toString();
      }
      if (page != null) {
        queryParameters['page'] = page.toString();
      }
    }

    final networkRequest = NetworkRequest(
      method: RequestMethod.get,
      path: ApiConstants.getAllBrands,
      queryParameters: queryParameters,
    );
    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) => BannerResponse.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }

  @override
  Future<ProductsResponseModel> getProducts({
    int? limit,
    String? sort,
    int? page,
    String? categoryId,
    String? subCategoryId,
  }) async {
    // Build the base URL
    String url = ApiConstants.getProducts;
    
    // Build query parameters manually
    final queryParams = <String>[];
    
    if (limit != null) queryParams.add('limit=${limit.toString()}');
    if (sort != null) queryParams.add('sort=$sort');
    if (page != null) queryParams.add('page=${page.toString()}');
    
    // Add category filters as separate parameters
    if (categoryId != null) queryParams.add('category[in]=$categoryId');
    if (subCategoryId != null) queryParams.add('category[in]=$subCategoryId');
    
    // Combine all parameters
    if (queryParams.isNotEmpty) {
      url += '?${queryParams.join('&')}';
    }
    
    final networkRequest = NetworkRequest(
      method: RequestMethod.get,
      path: url,
    );

    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) => ProductsResponseModel.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }

  @override
  Future<SubCategoryResponse> getSubCategoriesFromCategory(
    String categoryId,
  ) async {
    final networkRequest = NetworkRequest(
      method: RequestMethod.get,
      path:
          '${ApiConstants.getAllCategories}/$categoryId/${ApiConstants.getSubCategories}',
    );

    final result = await sl<NetworkService>().callApi(
      networkRequest,
      mapper: (json) =>
          SubCategoryResponse.fromJson(json as Map<String, dynamic>),
    );
    return result.data;
  }
}
