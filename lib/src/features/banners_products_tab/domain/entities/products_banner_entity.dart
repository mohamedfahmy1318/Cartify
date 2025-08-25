import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/subcategory_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/brand_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';

class ProductsBannerEntity extends Equatable {
  final int sold;
  final List<String> images;
  final List<SubcategoryEntity> subcategory;
  final int ratingsQuantity;
  final String id;
  final String title;
  final String slug;
  final String description;
  final int quantity;
  final int price;
  final List<String> availableColors;
  final String imageCover;
  final CategoryEntity category;
  final BrandEntity brand;
  final double ratingsAverage;
  final String createdAt;
  final String updatedAt;

  const ProductsBannerEntity({
    required this.sold,
    required this.images,
    required this.subcategory,
    required this.ratingsQuantity,
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    required this.quantity,
    required this.price,
    required this.availableColors,
    required this.imageCover,
    required this.category,
    required this.brand,
    required this.ratingsAverage,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    sold,
    images,
    subcategory,
    ratingsQuantity,
    id,
    title,
    slug,
    description,
    quantity,
    price,
    availableColors,
    imageCover,
    category,
    brand,
    ratingsAverage,
    createdAt,
    updatedAt,
  ];
}
