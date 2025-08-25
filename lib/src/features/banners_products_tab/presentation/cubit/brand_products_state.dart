import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_banner_entity.dart';

final class BrandProductState extends Equatable {
  // BrandProductState State
  final BaseStatus productsStatus;
  final List<ProductsBannerEntity> productsBannerEntity;
  final String productsErrorMessage;
  // Pagination State للـ Products
  final int currentPage;
  final int totalPages;
  final int totalResults;
  final bool hasNextPage;
  final bool isLoadingMore; // للـ pagination loading

  const BrandProductState({
    // Products
    required this.productsStatus,
    required this.productsBannerEntity,
    this.productsErrorMessage = ConstantManager.emptyText,
    // Pagination
    this.currentPage = 1,
    this.totalPages = 1,
    this.totalResults = 0,
    this.hasNextPage = false,
    this.isLoadingMore = false,
  });

  factory BrandProductState.initial() {
    return const BrandProductState(
      productsStatus: BaseStatus.initial,
      productsBannerEntity: [],
    );
  }

  BrandProductState copyWith({
    // Products
    BaseStatus? productsStatus,
    List<ProductsBannerEntity>? productsBannerEntity,
    String? productsErrorMessage,

    // Pagination
    int? currentPage,
    int? totalPages,
    int? totalResults,
    bool? hasNextPage,
    bool? isLoadingMore,
  }) {
    return BrandProductState(
      // Products
      productsStatus: productsStatus ?? this.productsStatus,
      productsBannerEntity: productsBannerEntity ?? this.productsBannerEntity,
      productsErrorMessage: productsErrorMessage ?? this.productsErrorMessage,

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
    // Products
    productsStatus,
    productsBannerEntity,
    productsErrorMessage,

    // Pagination
    currentPage,
    totalPages,
    totalResults,
    hasNextPage,
    isLoadingMore,
  ];
}
