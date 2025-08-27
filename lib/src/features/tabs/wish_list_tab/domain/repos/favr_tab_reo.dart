import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/add_to_fav_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_response_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class FavTabRepository {
  Future<Result<FavResponseEntity, Failure>> getFavoriteProducts();
  Future<Result<AddToFavResponseEntity, Failure>> addProductToFavorites(
    String productId,
  );
  Future<Result<AddToFavResponseEntity, Failure>> removeProductFromFavorites(
    String productId,
  );
}
