import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/product_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/repos/get_home_tab_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetProductsParams extends Equatable {
  final int? limit;
  final String? sort;
  final int? page;

  const GetProductsParams({this.limit, this.sort, this.page});

  @override
  List<Object?> get props => [limit, sort, page];
}

class GetProductsUseCase
    implements UseCase<ProductsResponseEntity, GetProductsParams?> {
  final GetHomeTabRepository _repository;

  GetProductsUseCase(this._repository);

  @override
  Future<Result<ProductsResponseEntity, Failure>> call(
    GetProductsParams? params,
  ) {
    return _repository.getProducts(
      limit: params?.limit,
      sort: params?.sort,
      page: params?.page,
    );
  }
}
