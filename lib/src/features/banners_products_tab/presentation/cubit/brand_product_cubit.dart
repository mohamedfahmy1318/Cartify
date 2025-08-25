import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/use_cases/get_brand_products_use_case.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/cubit/brand_products_state.dart';

class BrandProductCubit extends Cubit<BrandProductState> {
  BrandProductCubit(this.getBrandProductsUseCase)
    : super(BrandProductState.initial());

  final GetBrandProductsUseCase getBrandProductsUseCase;

  void fetchProducts(String brand, {int limit = 5}) async {
    emit(state.copyWith(productsStatus: BaseStatus.loading));
    final params = GetBannersProductsParams(
      limit: limit,
      page: 1,
      brand: brand,
    );
    final result = await getBrandProductsUseCase.call(params);
    result.when(
      (success) => emit(
        state.copyWith(
          productsStatus: BaseStatus.success,
          productsBannerEntity: success.data,
          currentPage: success.metadata.currentPage,
          totalPages: success.metadata.numberOfPages,
          totalResults: success.results,
          hasNextPage: success.metadata.nextPage != null,
        ),
      ),
      (error) => emit(
        state.copyWith(
          productsStatus: BaseStatus.error,
          productsErrorMessage: error.message,
        ),
      ),
    );
  }

  void loadMoreProducts(String brand, {int limit = 5}) async {
    if (!state.hasNextPage || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;
    final params = GetBannersProductsParams(
      limit: limit,
      page: nextPage,
      brand: brand,
    );
    final result = await getBrandProductsUseCase.call(params);

    result.when(
      (success) {
        final updatedProducts = List.of(state.productsBannerEntity)
          ..addAll(success.data);

        emit(
          state.copyWith(
            productsBannerEntity: updatedProducts,
            currentPage: success.metadata.currentPage,
            totalPages: success.metadata.numberOfPages,
            totalResults: success.results,
            hasNextPage: success.metadata.nextPage != null,
            isLoadingMore: false,
          ),
        );
      },
      (error) => emit(
        state.copyWith(
          isLoadingMore: false,
          productsErrorMessage: error.message,
        ),
      ),
    );
  }

  void refreshProducts(String brand, {int limit = 5}) async {
    emit(
      state.copyWith(
        productsStatus: BaseStatus.loading,
        productsBannerEntity: [],
        currentPage: 1,
        hasNextPage: false,
      ),
    );

    fetchProducts(brand, limit: limit);
  }
}
