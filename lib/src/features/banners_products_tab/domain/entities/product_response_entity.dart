import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_banner_entity.dart';

class ProductsBannerMetadataEntity extends Equatable {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const ProductsBannerMetadataEntity({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  @override
  List<Object?> get props => [currentPage, numberOfPages, limit, nextPage];
}

class ProductsBannerResponseEntity extends Equatable {
  final int results;
  final ProductsBannerMetadataEntity metadata;
  final List<ProductsBannerEntity> data;

  const ProductsBannerResponseEntity({
    required this.results,
    required this.metadata,
    required this.data,
  });

  @override
  List<Object?> get props => [results, metadata, data];
}
