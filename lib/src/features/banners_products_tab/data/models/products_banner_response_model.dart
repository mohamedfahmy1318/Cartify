import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/product_response_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/products_banner_model.dart';

class ProductsBannerMetadataModel {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const ProductsBannerMetadataModel({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory ProductsBannerMetadataModel.fromJson(Map<String, dynamic> json) {
    return ProductsBannerMetadataModel(
      currentPage: json['currentPage'] as int? ?? 1,
      numberOfPages: json['numberOfPages'] as int? ?? 1,
      limit: json['limit'] as int? ?? 20,
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

  // Convert to Entity
  ProductsBannerMetadataEntity toEntity() {
    return ProductsBannerMetadataEntity(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
      nextPage: nextPage,
    );
  }
}

class ProductsBannerResponseModel {
  final int results;
  final ProductsBannerMetadataModel metadata;
  final List<ProductsBannerModel> data;

  const ProductsBannerResponseModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductsBannerResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductsBannerResponseModel(
      results: json['results'] as int? ?? 0,
      metadata: json['metadata'] != null
          ? ProductsBannerMetadataModel.fromJson(
              json['metadata'] as Map<String, dynamic>,
            )
          : const ProductsBannerMetadataModel(
              currentPage: 1,
              numberOfPages: 1,
              limit: 20,
            ),
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
                .map(
                  (item) => ProductsBannerModel.fromJson(
                    item as Map<String, dynamic>,
                  ),
                )
                .toList()
          : <ProductsBannerModel>[],
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
  ProductsBannerResponseEntity toEntity() {
    return ProductsBannerResponseEntity(
      results: results,
      metadata: metadata.toEntity(),
      data: data
          .map(
            (item) => item,
          ) // ProductsBannerModel extends ProductsBannerEntity
          .toList(),
    );
  }
}
