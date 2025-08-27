import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/add_to_fav_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/repos/favr_tab_reo.dart';
import 'package:multiple_result/multiple_result.dart';

class AddProductToFavoritesUseCase {
  final FavTabRepository _repository;
  AddProductToFavoritesUseCase(this._repository);

  Future<Result<AddToFavResponseEntity, Failure>> call(String productId) {
    return _repository.addProductToFavorites(productId);
  }
}
