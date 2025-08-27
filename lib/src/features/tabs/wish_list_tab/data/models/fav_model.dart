import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/subcategory_model.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/brand_model.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/models/category_response.dart';

class FavModel extends FavEntity {
  const FavModel({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
  });

  factory FavModel.fromJson(Map<String, dynamic> json) {
    return FavModel(
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
      id: json['_id'] as String? ?? json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      quantity: json['quantity'] as int? ?? 0,
      price: json['price'] as int? ?? 0,
      imageCover: (json['imageCover'] as String?)?.isNotEmpty == true
          ? json['imageCover'] as String
          : 'https://via.placeholder.com/300x300.png?text=No+Image',
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
      'sold': sold ?? 0,
      'images': images ?? [],
      'subcategory':
          subcategory
              ?.map((item) => (item as SubcategoryModel).toJson())
              .toList() ??
          [],
      'ratingsQuantity': ratingsQuantity ?? 0,
      '_id': id ?? '',
      'title': title ?? '',
      'slug': slug ?? '',
      'description': description ?? '',
      'quantity': quantity ?? 0,
      'price': price ?? 0,
      'imageCover': imageCover ?? '',
      'category': category != null ? (category as CategoryModel).toJson() : {},
      'brand': brand != null ? (brand as BrandModel).toJson() : {},
      'ratingsAverage': ratingsAverage ?? 0.0,
      'createdAt': createdAt ?? '',
      'updatedAt': updatedAt ?? '',
    };
  }

  factory FavModel.fromEntity(FavEntity entity) {
    return FavModel(
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
      imageCover: entity.imageCover,
      category: entity.category,
      brand: entity.brand,
      ratingsAverage: entity.ratingsAverage,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }

  FavEntity toEntity() {
    return FavEntity(
      sold: sold,
      images: images,
      subcategory: subcategory,
      ratingsQuantity: ratingsQuantity,
      id: id,
      title: title,
      slug: slug,
      description: description,
      quantity: quantity,
      price: price,
      imageCover: imageCover,
      category: category,
      brand: brand,
      ratingsAverage: ratingsAverage,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
