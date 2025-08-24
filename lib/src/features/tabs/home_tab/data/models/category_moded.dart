import '../../domain/entities/category_entity.dart';

class CategoryResponseModel {
  final int results;
  final List<CategoryModel> data;

  const CategoryResponseModel({required this.results, required this.data});

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoryResponseModel(
      results: json['results'] as int,
      data: (json['data'] as List)
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      image: json['image'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory CategoryModel.fromEntity(CategoryEntity entity) {
    return CategoryModel(
      id: entity.id,
      name: entity.name,
      slug: entity.slug,
      image: entity.image,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
