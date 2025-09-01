import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/repos/get_brand_products_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetProductDetailsUseCase implements UseCase<ProductEntity, String> {
  final GetBrandProductsRepo _repository;

  GetProductDetailsUseCase(this._repository);

  @override
  Future<Result<ProductEntity, Failure>> call(String productId) {
    return _repository.getProductDetail(productId);
  }
}
