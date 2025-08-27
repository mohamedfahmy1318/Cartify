import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/data/data_sources/fav_tab_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/add_to_fav_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/repos/favr_tab_reo.dart';
import 'package:multiple_result/multiple_result.dart';

class FavTabRepositoryImpl implements FavTabRepository {
  final FavTabRemoteDataSource _remoteDataSource;
  FavTabRepositoryImpl(this._remoteDataSource);
  @override
  Future<Result<FavResponseEntity, Failure>> getFavoriteProducts() {
    return _remoteDataSource
        .getFavoriteProducts()
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<AddToFavResponseEntity, Failure>> addProductToFavorites(
    String productId,
  ) {
    return _remoteDataSource
        .addProductToFavorites(productId)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }

  @override
  Future<Result<AddToFavResponseEntity, Failure>> removeProductFromFavorites(
    String productId,
  ) {
    return _remoteDataSource
        .removeProductFromFavorites(productId)
        .then((response) => response.toEntity())
        .handleCallbackWithFailure();
  }
}
