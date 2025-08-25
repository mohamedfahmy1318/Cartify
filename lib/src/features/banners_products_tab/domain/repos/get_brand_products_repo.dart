import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/product_response_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_banner_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class GetBrandProductsRepo {
  Future<Result<ProductsBannerResponseEntity, Failure>> getBanners(
    String brand, {
    int? page,
    int? limit,
  });
  Future<Result<ProductsBannerEntity, Failure>> getProductDetail(
    String productId,
  );
}
