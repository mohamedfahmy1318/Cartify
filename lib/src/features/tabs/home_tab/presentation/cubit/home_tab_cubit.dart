import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_category_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_banners_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit(this.fetchCategoriesUseCase, this.getBannersUseCase)
    : super(HomeTabState.initial());

  final GetCategoryUseCase fetchCategoriesUseCase;
  final GetBannersUseCase getBannersUseCase;
  // CATEGORIES METHODS
  void fetchCategories({int? limit}) async {
    emit(state.copyWith(categoriesStatus: BaseStatus.loading));

    final result = await fetchCategoriesUseCase.call(limit);
    result.when(
      (success) => emit(
        state.copyWith(
          categoriesStatus: BaseStatus.success,
          categories: success,
        ),
      ),
      (error) => emit(
        state.copyWith(
          categoriesStatus: BaseStatus.error,
          categoriesErrorMessage: error.message,
        ),
      ),
    );
  }

  // BANNERS METHODS

  /// جلب الـ Banners من الصفحة الأولى (Fresh Load)
  void fetchBanners({int limit = 5}) async {
    emit(state.copyWith(bannersStatus: BaseStatus.loading));
    final params = GetBannersParams(limit: limit, page: 1);
    final result = await getBannersUseCase.call(params);
    result.when(
      (success) => emit(
        state.copyWith(
          bannersStatus: BaseStatus.success,
          banners: success.data,
          currentPage: success.metadata.currentPage,
          totalPages: success.metadata.numberOfPages,
          totalResults: success.results,
          hasNextPage: success.metadata.nextPage != null,
        ),
      ),
      (error) => emit(
        state.copyWith(
          bannersStatus: BaseStatus.error,
          bannersErrorMessage: error.message,
        ),
      ),
    );
  }

  /// تحميل المزيد من الـ Banners (Load More Pagination)
  void loadMoreBanners({int limit = 5}) async {
    // تحقق إذا كان هناك صفحة تالية ومش بنحمل حالياً
    if (!state.hasNextPage || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;
    final params = GetBannersParams(limit: limit, page: nextPage);
    final result = await getBannersUseCase.call(params);

    result.when(
      (success) {
        // إضافة البانرز الجديدة للقائمة الموجودة
        final updatedBanners = List.of(state.banners)..addAll(success.data);

        emit(
          state.copyWith(
            banners: updatedBanners,
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
          bannersErrorMessage: error.message,
        ),
      ),
    );
  }

  /// إعادة تحميل الـ Banners (Refresh)
  void refreshBanners({int limit = 5}) async {
    // إعادة تعيين الحالة والعودة للصفحة الأولى
    emit(
      state.copyWith(
        bannersStatus: BaseStatus.loading,
        banners: [],
        currentPage: 1,
        hasNextPage: false,
      ),
    );

    fetchBanners(limit: limit);
  }

  // COMBINED METHODS

  /// تحميل جميع البيانات (Categories + Banners)
  void fetchHomeData({int? categoriesLimit, int bannersLimit = 5}) {
    fetchCategories(limit: categoriesLimit);
    fetchBanners(limit: bannersLimit);
  }
}
