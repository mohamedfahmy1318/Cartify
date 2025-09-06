
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_category_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_banners_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_products_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_sub_category_onCategory.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit(
    this.fetchCategoriesUseCase,
    this.getBannersUseCase,
    this.getProductsUseCase,
    this.getSubCategoryUseCase,
  ) : super(HomeTabState.initial());

  final GetCategoryUseCase fetchCategoriesUseCase;
  final GetBannersUseCase getBannersUseCase;
  final GetProductsUseCase getProductsUseCase;
  final GetSubCategoryUseCase getSubCategoryUseCase;

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

  // ------------------- PRODUCTS ------------
  void fetchProducts({
    int? limit,
    String? categoryId,
    String? subCategoryId,
  }) async {
    emit(state.copyWith(productsStatus: BaseStatus.loading));

    final params = GetProductsParams(
      limit: limit,
      page: 1,
      sort: '-price',
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );
    final result = await getProductsUseCase.call(params);

    result.when(
      (success) => emit(
        state.copyWith(
          productsStatus: BaseStatus.success,
          products: success.data,
          allProducts: success.data, // حفظ جميع المنتجات
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

  void loadMoreProducts({int limit = 5}) async {
    if (!state.hasNextPage || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));

    final nextPage = state.currentPage + 1;
    final params = GetProductsParams(
      limit: limit,
      page: nextPage,
      sort: '-price',
    );
    final result = await getProductsUseCase.call(params);

    result.when(
      (success) {
        final updatedAll = List.of(state.products)..addAll(success.data);

        emit(
          state.copyWith(
            products: updatedAll,
            allProducts: updatedAll,
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

  void refreshProducts({int limit = 5}) async {
    // إعادة تعيين الحالة والعودة للصفحة الأولى
    emit(
      state.copyWith(
        productsStatus: BaseStatus.loading,
        products: [],
        currentPage: 1,
        hasNextPage: false,
      ),
    );

    fetchProducts(limit: limit);
  }

  /// جلب SubCategories
  void fetchSubCategories(String categoryId) async {
    emit(state.copyWith(subCategoriesStatus: BaseStatus.loading));

    final result = await getSubCategoryUseCase.call(categoryId);

    result.when(
      (success) => emit(
        state.copyWith(
          subCategoriesStatus: BaseStatus.success,
          subCategories: success.data,
        ),
      ),
      (error) => emit(
        state.copyWith(
          subCategoriesStatus: BaseStatus.error,
          subCategoriesErrorMessage: error.message,
        ),
      ),
    );
  }

  /// تحميل جميع البيانات (Categories + Banners)
  void fetchHomeData({int? categoriesLimit, int bannersLimit = 5}) {
    fetchCategories(limit: categoriesLimit);
    fetchBanners(limit: bannersLimit);
    fetchProducts(limit: 8);
  }
  //search
    Timer? _searchDebounce;

  // استدعاء عند كل تغيير في الـ TextField
  void onSearchChanged(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      _searchLocal(query);
    });
  }

  void _searchLocal(String query) {
    final q = _normalize(query);
    if (q.isEmpty) {
      emit(state.copyWith(products: state.allProducts, searchQuery: ''));
      return;
    }

    final filtered = state.allProducts.where((p) {
      final name = _normalize(p.title);
      final brand = _normalize(p.brand.name );
      final category = _normalize(p.category.name );
      final sku = _normalize(p.price.toString());
      // ضيف أي حقول تانية تحب تبحث فيها (desc, tags...)
      return name.contains(q) ||
             brand.contains(q) ||
             category.contains(q) ||
             sku.contains(q);
    }).toList();

    emit(state.copyWith(products: filtered, searchQuery: query));
  }

  String _normalize(String s) {
    var r = s.trim().toLowerCase();
    // ازالة التشكيل (تقدر تحسّن regex لو عايز)
    r = r.replaceAll(RegExp('[\\u0610-\\u061A\\u064B-\\u065F\\u0670\\u06D6-\\u06ED]'), '');
    // تبسيط الحروف العربية
    r = r.replaceAll('أ', 'ا').replaceAll('إ', 'ا').replaceAll('آ', 'ا');
    r = r.replaceAll('ى', 'ي').replaceAll('ة', 'ه');
    // ازالة علامات خاصة
    r = r.replaceAll(RegExp(r'[^0-9a-z\u0621-\u064A\s]'), ' ');
    r = r.replaceAll(RegExp(r'\s+'), ' ');
    return r;
  }

  @override
  Future<void> close() {
    _searchDebounce?.cancel();
    return super.close();
  }

}
