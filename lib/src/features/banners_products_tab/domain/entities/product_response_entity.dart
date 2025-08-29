import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_banner_entity.dart';

class ProductsMetadataEntity extends Equatable {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const ProductsMetadataEntity({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  @override
  List<Object?> get props => [currentPage, numberOfPages, limit, nextPage];
}

class ProductsResponseEntity extends Equatable {
  final int results;
  final ProductsMetadataEntity metadata;
  final List<ProductEntity> data;

  const ProductsResponseEntity({
    required this.results,
    required this.metadata,
    required this.data,
  });

  @override
  List<Object?> get props => [results, metadata, data];
}
