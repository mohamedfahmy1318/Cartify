import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/product_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_response_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class GetHomeTabRepository {
  Future<Result<List<CategoryEntity>, Failure>> getCategories({int? limit});
  Future<Result<BannerResponseEntity, Failure>> getBanners({
    int? limit,
    int? page,
  });
  Future<Result<ProductsResponseEntity, Failure>> getProducts({
    int? limit,
    String? sort,
    int? page,
  });
}
