import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/repos/favr_tab_reo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetFavProductsUseCase {
  final FavTabRepository _repository;
  GetFavProductsUseCase(this._repository);

  Future<Result<FavResponseEntity, Failure>> call() {
    return _repository.getFavoriteProducts();
  }
}
