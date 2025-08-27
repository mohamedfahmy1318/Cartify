import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/subcategory_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/brand_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';

class FavEntity extends Equatable {
  final int? sold;
  final List<String>? images;
  final List<SubcategoryEntity>? subcategory;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryEntity? category;
  final BrandEntity? brand;
  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;

  const FavEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
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
    imageCover,
    category,
    brand,
    ratingsAverage,
    createdAt,
    updatedAt,
  ];
}
