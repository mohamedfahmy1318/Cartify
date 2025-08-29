import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/product_response_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/models/products_model.dart';

class ProductsMetadataModel {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const ProductsMetadataModel({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  factory ProductsMetadataModel.fromJson(Map<String, dynamic> json) {
    return ProductsMetadataModel(
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
  ProductsMetadataEntity toEntity() {
    return ProductsMetadataEntity(
      currentPage: currentPage,
      numberOfPages: numberOfPages,
      limit: limit,
      nextPage: nextPage,
    );
  }
}

class ProductsResponseModel {
  final int results;
  final ProductsMetadataModel metadata;
  final List<ProductModel> data;

  const ProductsResponseModel({
    required this.results,
    required this.metadata,
    required this.data,
  });

  factory ProductsResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductsResponseModel(
      results: json['results'] as int? ?? 0,
      metadata: json['metadata'] != null
          ? ProductsMetadataModel.fromJson(
              json['metadata'] as Map<String, dynamic>,
            )
          : const ProductsMetadataModel(
              currentPage: 1,
              numberOfPages: 1,
              limit: 20,
            ),
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
                .map(
                  (item) => ProductModel.fromJson(item as Map<String, dynamic>),
                )
                .toList()
          : <ProductModel>[],
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
  ProductsResponseEntity toEntity() {
    return ProductsResponseEntity(
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
