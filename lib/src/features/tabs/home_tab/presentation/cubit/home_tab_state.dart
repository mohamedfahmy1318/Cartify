import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_entity.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/sub_category_entity.dart';

final class HomeTabState extends Equatable {
  // Categories State
  final BaseStatus categoriesStatus;
  final List<CategoryEntity> categories;
  final String categoriesErrorMessage;
  // Banners State
  final BaseStatus bannersStatus;
  final List<BannerEntity> banners;
  final String bannersErrorMessage;
  // Products State
  final BaseStatus productsStatus;
  final List<ProductEntity> products;
  final String productsErrorMessage;
  final List<ProductEntity> allProducts;
  final String searchQuery;
  //subCategory
  final BaseStatus subCategoriesStatus;
  final List<SubCategoryEntity> subCategories;
  final String subCategoriesErrorMessage;

  // Pagination State للـ Banners
  final int currentPage;
  final int totalPages;
  final int totalResults;
  final bool hasNextPage;
  final bool isLoadingMore; // للـ pagination loading

  const HomeTabState({
    // Categories
    required this.categoriesStatus,
    required this.categories,
    this.categoriesErrorMessage = ConstantManager.emptyText,
    // Banners
    required this.bannersStatus,
    required this.banners,
    this.bannersErrorMessage = ConstantManager.emptyText,
    // Products
    required this.productsStatus,
    required this.products,
    this.productsErrorMessage = ConstantManager.emptyText,
    this.allProducts = const [],
    this.searchQuery = '',
    //subCategories
    required this.subCategoriesStatus,
    required this.subCategories,
    this.subCategoriesErrorMessage = ConstantManager.emptyText,
    // Pagination
    this.currentPage = 1,
    this.totalPages = 1,
    this.totalResults = 0,
    this.hasNextPage = false,
    this.isLoadingMore = false,
  });

  factory HomeTabState.initial() {
    return const HomeTabState(
      categoriesStatus: BaseStatus.initial,
      categories: [],
      bannersStatus: BaseStatus.initial,
      banners: [],
      productsStatus: BaseStatus.initial,
      products: [],
      subCategoriesStatus: BaseStatus.initial,
      subCategories: [],
      allProducts: [],
      searchQuery: '',
    );
  }

  HomeTabState copyWith({
    // Categories
    BaseStatus? categoriesStatus,
    List<CategoryEntity>? categories,
    String? categoriesErrorMessage,

    // Banners
    BaseStatus? bannersStatus,
    List<BannerEntity>? banners,
    String? bannersErrorMessage,
    // Products
    BaseStatus? productsStatus,
    List<ProductEntity>? products,
    String? productsErrorMessage,
     List<ProductEntity>? allProducts,
  String? searchQuery,
    //subcategories
    BaseStatus? subCategoriesStatus,
    List<SubCategoryEntity>? subCategories,
    String? subCategoriesErrorMessage,

    // Pagination
    int? currentPage,
    int? totalPages,
    int? totalResults,
    bool? hasNextPage,
    bool? isLoadingMore,
  }) {
    return HomeTabState(
      // Categories
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categories: categories ?? this.categories,
      categoriesErrorMessage:
          categoriesErrorMessage ?? this.categoriesErrorMessage,

      // Banners
      bannersStatus: bannersStatus ?? this.bannersStatus,
      banners: banners ?? this.banners,
      bannersErrorMessage: bannersErrorMessage ?? this.bannersErrorMessage,

      // Products
      productsStatus: productsStatus ?? this.productsStatus,
      products: products ?? this.products,
      productsErrorMessage: productsErrorMessage ?? this.productsErrorMessage,
    allProducts: allProducts ?? this.allProducts,
    searchQuery: searchQuery ?? this.searchQuery,
      //subcategories
      subCategoriesStatus: subCategoriesStatus ?? this.subCategoriesStatus,
      subCategories: subCategories ?? this.subCategories,
      subCategoriesErrorMessage:
          subCategoriesErrorMessage ?? this.subCategoriesErrorMessage,
      // Pagination
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object> get props => [
    // Categories
    categoriesStatus,
    categories,
    categoriesErrorMessage,

    // Banners
    bannersStatus,
    banners,
    bannersErrorMessage,
    // Products
    productsStatus,
    products,
    productsErrorMessage,
    //subcategory
    subCategoriesStatus,
    subCategories,
    subCategoriesErrorMessage,
    // All Products
    allProducts,
    // Search Query
    searchQuery,

    // Pagination
    currentPage,
    totalPages,
    totalResults,
    hasNextPage,
    isLoadingMore,
  ];
}
