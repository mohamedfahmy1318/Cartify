import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_entity.dart';

final class HomeTabState extends Equatable {
  // Categories State
  final BaseStatus categoriesStatus;
  final List<CategoryEntity> categories;
  final String categoriesErrorMessage;
  // Banners State
  final BaseStatus bannersStatus;
  final List<BannerEntity> banners;
  final String bannersErrorMessage;
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

    // Pagination
    currentPage,
    totalPages,
    totalResults,
    hasNextPage,
    isLoadingMore,
  ];
}
