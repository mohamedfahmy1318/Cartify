import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/product_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/data_sources/home_tab_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/sub_category_response.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/repos/get_home_tab_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetHomeTabRepositoryImpl implements GetHomeTabRepository {
  final HomeTabRemoteDataSource remoteDataSource;

  GetHomeTabRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<List<CategoryEntity>, Failure>> getCategories({int? limit}) {
    return remoteDataSource
        .getCategories(limit: limit)
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<BannerResponseEntity, Failure>> getBanners({
    int? limit,
    int? page,
  }) {
    return remoteDataSource
        .getBanners(limit: limit, page: page)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<ProductsResponseEntity, Failure>> getProducts({
    int? limit,
    String? sort,
    int? page,
    String? categoryId,
    String? subCategoryId,
  }) {
    return remoteDataSource
        .getProducts(
          limit: limit,
          sort: sort,
          page: page,
          categoryId: categoryId,
          subCategoryId: subCategoryId,
        )
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<SubCategoryResponseEntity, Failure>> getSubCategoriesFromCategory(String categoryId) {
    return remoteDataSource
        .getSubCategoriesFromCategory(categoryId)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }
}
