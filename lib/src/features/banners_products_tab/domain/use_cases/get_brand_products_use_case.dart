import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/product_response_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/repos/get_brand_products_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetBannersProductsParams extends Equatable {
  final int? limit;
  final int? page;
  final String brand;

  const GetBannersProductsParams({this.limit, this.page, required this.brand});

  @override
  List<Object?> get props => [limit, page, brand];
}

class GetBrandProductsUseCase
    implements UseCase<ProductsResponseEntity, GetBannersProductsParams> {
  final GetBrandProductsRepo _repository;

  GetBrandProductsUseCase(this._repository);

  @override
  Future<Result<ProductsResponseEntity, Failure>> call(
    GetBannersProductsParams params,
  ) {
    return _repository.getBanners(
      params.brand,
      page: params.page,
      limit: params.limit,
    );
  }
}
