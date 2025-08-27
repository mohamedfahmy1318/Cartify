import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/use_cases/get_fav_products_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(this.getFavProductsUseCase) : super(FavoritesState.initial());

  final GetFavProductsUseCase getFavProductsUseCase;

  void getFavProducts() async {
    emit(state.copyWith(favoritesStatus: BaseStatus.loading));
    final result = await getFavProductsUseCase.call();
    result.when(
      (success) => emit(
        state.copyWith(
          favoritesStatus: BaseStatus.success,
          favEntity: success.data,
        ),
      ),
      (error) => emit(
        state.copyWith(
          favoritesStatus: BaseStatus.error,
          favoriteProductErrorMessage: error.message,
        ),
      ),
    );
  }
}
