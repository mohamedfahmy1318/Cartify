import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/data_sources/get_products_banners.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/product_response_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/repos/get_brand_products_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetBrandProductsRepoImpl implements GetBrandProductsRepo {
  final GetProductsBannersDataSource _remoteDataSource;
  GetBrandProductsRepoImpl(this._remoteDataSource);
  @override
  Future<Result<ProductsResponseEntity, Failure>> getBanners(
    String brand, {
    int? page,
    int? limit,
  }) {
    return _remoteDataSource
        .getProductsBanners(brand)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<ProductEntity, Failure>> getProductDetail(String productId) {
    return _remoteDataSource
        .getProductDetail(productId)
        .handleCallbackWithFailure();
  }
}
