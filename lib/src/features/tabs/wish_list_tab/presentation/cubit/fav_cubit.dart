import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/use_cases/add_product_to_favorites_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/use_cases/get_fav_products_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/use_cases/remove_product_from_favorites_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(
    this.getFavProductsUseCase,
    this.addProductToFavoritesUseCase,
    this.removeProductFromFavoritesUseCase,
  ) : super(FavoritesState.initial());

  final GetFavProductsUseCase getFavProductsUseCase;
  final AddProductToFavoritesUseCase addProductToFavoritesUseCase;
  final RemoveProductFromFavoritesUseCase removeProductFromFavoritesUseCase;

  Future<void> getFavProducts() async {
    emit(state.copyWith(favoritesStatus: BaseStatus.loading));
    final result = await getFavProductsUseCase.call();
    result.when(
      (success) {
        emit(
          state.copyWith(
            favoritesStatus: BaseStatus.success,
            favEntity: success.data ?? [],
          ),
        );
      },
      (error) {
        emit(
          state.copyWith(
            favoritesStatus: BaseStatus.error,
            favoriteProductErrorMessage: error.message,
            favEntity: [],
          ),
        );
      },
    );
  }

  Future<void> addProductToFavorites(FavEntity product) async {
    final updatedList = List<FavEntity>.from(state.favEntity)..add(product);
    emit(state.copyWith(favEntity: updatedList));

    final result = await addProductToFavoritesUseCase.call(product.id!);
    result.when(
      (success) {
        return getFavProducts();
      },
      (error) {
        // revert
        final revertedList = List<FavEntity>.from(state.favEntity)
          ..removeWhere((e) => e.id == product.id);
        emit(state.copyWith(favEntity: revertedList));
      },
    );
  }

  /// ✅ remove product (optimistic update)
  Future<void> removeProductFromFavorites(String productId) async {
    final updatedList = List<FavEntity>.from(state.favEntity)
      ..removeWhere((e) => e.id == productId);
    emit(state.copyWith(favEntity: updatedList));

    final result = await removeProductFromFavoritesUseCase.call(productId);
    result.when((success) => getFavProducts(), (error) {
      getFavProducts();
    });
  }

  /// ✅ toggle favorite status
  void toggleFavorite(FavEntity product) {
    if (isFavorite(product.id!)) {
      removeProductFromFavorites(product.id!);
    } else {
      addProductToFavorites(product);
    }
  }

  bool isFavorite(String id) {
    return state.favEntity.any((e) => e.id == id);
  }
}
