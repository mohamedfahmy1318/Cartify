import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_response_entity.dart';

class BannerMetadata {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const BannerMetadata({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory BannerMetadata.fromJson(Map<String, dynamic> json) {
    return BannerMetadata(
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

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.name,
    required super.slug,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
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

  factory BannerModel.fromEntity(BannerEntity entity) {
    return BannerModel(
      id: entity.id,
      name: entity.name,
      slug: entity.slug,
      image: entity.image,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}

class BannerResponse {
  final int results;
  final BannerMetadata metadata;
  final List<BannerModel> data;

  const BannerResponse({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    return BannerResponse(
      results: json['results'] as int,
      metadata: BannerMetadata.fromJson(
        json['metadata'] as Map<String, dynamic>,
      ),
      data: (json['data'] as List<dynamic>)
          .map((item) => BannerModel.fromJson(item as Map<String, dynamic>))
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
  BannerResponseEntity toEntity() {
    return BannerResponseEntity(
      results: results,
      metadata: metadata.toEntity(),
      data: data
          .map((item) => item)
          .toList(), // BannerModel extends BannerEntity
    );
  }
}

// Extension methods for converting Models to Entities
extension BannerMetadataExtension on BannerMetadata {
  BannerMetadataEntity toEntity() {
    return BannerMetadataEntity(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
      nextPage: nextPage,
    );
  }
}



