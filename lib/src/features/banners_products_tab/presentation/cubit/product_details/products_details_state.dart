import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_banner_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/brand_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';

final class ProductDetailsState extends Equatable {
  // ProductDetailsState State
  final BaseStatus productsStatus;
  final ProductsBannerEntity productsBannerEntity;
  final String productsDetailsErrorMessage;

  const ProductDetailsState({
    // Products
    required this.productsStatus,
    required this.productsBannerEntity,
    this.productsDetailsErrorMessage = ConstantManager.emptyText,
  });

  factory ProductDetailsState.initial() {
    return const ProductDetailsState(
      productsStatus: BaseStatus.initial,
      productsBannerEntity: ProductsBannerEntity(
        sold: 0,
        images: [],
        subcategory: [],
        ratingsQuantity: 0,
        id: '',
        title: '',
        slug: '',
        description: '',
        quantity: 0,
        price: 0,
        availableColors: [],
        imageCover: '',
        category: CategoryEntity(
          id: '',
          name: '',
          slug: '',
          image: '',
          createdAt: '',
          updatedAt: '',
        ),
        brand: BrandEntity(id: '', name: '', slug: '', image: ''),
        ratingsAverage: 0.0,
        createdAt: '',
        updatedAt: '',
      ),
    );
  }

  ProductDetailsState copyWith({
    // Products
    BaseStatus? productsStatus,
    ProductsBannerEntity? productsBannerEntity,
    String? productsDetailsErrorMessage,
  }) {
    return ProductDetailsState(
      // Products
      productsStatus: productsStatus ?? this.productsStatus,
      productsBannerEntity: productsBannerEntity ?? this.productsBannerEntity,
      productsDetailsErrorMessage:
          productsDetailsErrorMessage ?? this.productsDetailsErrorMessage,
    );
  }

  @override
  List<Object> get props => [
    // Products
    productsStatus,
    productsBannerEntity,
    productsDetailsErrorMessage,
  ];
}
