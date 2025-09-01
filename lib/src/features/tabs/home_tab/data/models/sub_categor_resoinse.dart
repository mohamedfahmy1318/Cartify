import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/sub_category_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/sub_category_response.dart';

class SubCategoryMetadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const SubCategoryMetadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory SubCategoryMetadata.fromJson(Map<String, dynamic> json) {
    return SubCategoryMetadata(
      currentPage: json['currentPage'] as int,
      numberOfPages: json['numberOfPages'] as int,
      limit: json['limit'] as int,
      nextPage: json['nextPage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'numberOfPages': numberOfPages,
      'limit': limit,
      if (nextPage != null) 'nextPage': nextPage,
    };
  }
}

class SubCategoryModel extends SubCategoryEntity {
  const SubCategoryModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.createdAt,
    required super.updatedAt,
  });

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['_id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'slug': slug,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory SubCategoryModel.fromEntity(SubCategoryEntity entity) {
    return SubCategoryModel(
      id: entity.id,
      name: entity.name,
      slug: entity.slug,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

class SubCategoryResponse {
  final int results;
  final SubCategoryMetadata metadata;
  final List<SubCategoryModel> data;

  const SubCategoryResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory SubCategoryResponse.fromJson(Map<String, dynamic> json) {
    return SubCategoryResponse(
      results: json['results'] as int,
      metadata: SubCategoryMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      data: (json['data'] as List<dynamic>)
          .map((item) => SubCategoryModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'metadata': metadata.toJson(),
      'data': data.map((item) => item.toJson()).toList(),
    };
  }

  // Convert to Entity
  SubCategoryResponseEntity toEntity() {
    return SubCategoryResponseEntity(
      results: results,
      metadata: metadata.toEntity(),
      data: data
          .map((item) => item)
          .toList(), // SubCategoryModel extends SubCategoryEntity
    );
  }
}

// Extension methods for converting Models to Entities
extension SubCategoryMetadataExtension on SubCategoryMetadata {
  SubCategoryMetadataEntity toEntity() {
    return SubCategoryMetadataEntity(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
      nextPage: nextPage,
    );
  }
}



