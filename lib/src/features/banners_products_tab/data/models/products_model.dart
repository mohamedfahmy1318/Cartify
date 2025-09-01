import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/subcategory_model.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/brand_model.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/models/category_response.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.sold,
    required super.images,
    required super.subcategory,
    required super.ratingsQuantity,
    required super.id,
    required super.title,
    required super.slug,
    required super.description,
    required super.quantity,
    required super.price,
    required super.availableColors,
    required super.imageCover,
    required super.category,
    required super.brand,
    required super.ratingsAverage,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      sold: json['sold'] as int? ?? 0,
      images: json['images'] != null
          ? List<String>.from(json['images'] as List)
          : <String>[],
      subcategory: json['subcategory'] != null
          ? (json['subcategory'] as List)
                .map(
                  (item) =>
                      SubcategoryModel.fromJson(item as Map<String, dynamic>),
                )
                .toList()
          : <SubcategoryModel>[],
      ratingsQuantity: json['ratingsQuantity'] as int? ?? 0,
      id: json['_id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      availableColors: json['availableColors'] != null
          ? List<String>.from(json['availableColors'] as List)
          : <String>[],
      imageCover: json['imageCover'] as String? ?? '',
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'] as Map<String, dynamic>)
          : const CategoryModel(
              id: '',
              name: '',
              slug: '',
              image: '',
              createdAt: '',
              updatedAt: '',
            ),
      brand: json['brand'] != null
          ? BrandModel.fromJson(json['brand'] as Map<String, dynamic>)
          : const BrandModel(id: '', name: '', slug: '', image: ''),
      ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble() ?? 0.0,
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sold': sold,
      'images': images,
      'subcategory': subcategory
          .map((item) => (item as SubcategoryModel).toJson())
          .toList(),
      'ratingsQuantity': ratingsQuantity,
      '_id': id,
      'title': title,
      'slug': slug,
      'description': description,
      'quantity': quantity,
      'price': price,
      'availableColors': availableColors,
      'imageCover': imageCover,
      'category': (category as CategoryModel).toJson(),
      'brand': (brand as BrandModel).toJson(),
      'ratingsAverage': ratingsAverage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      sold: entity.sold,
      images: entity.images,
      subcategory: entity.subcategory,
      ratingsQuantity: entity.ratingsQuantity,
      id: entity.id,
      title: entity.title,
      slug: entity.slug,
      description: entity.description,
      quantity: entity.quantity,
      price: entity.price,
      availableColors: entity.availableColors,
      imageCover: entity.imageCover,
      category: entity.category,
      brand: entity.brand,
      ratingsAverage: entity.ratingsAverage,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
