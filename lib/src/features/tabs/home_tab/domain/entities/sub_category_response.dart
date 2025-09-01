import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/sub_category_entity.dart';

class SubCategoryMetadataEntity extends Equatable {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const SubCategoryMetadataEntity({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  @override
  List<Object?> get props => [currentPage, numberOfPages, limit, nextPage];
}

class SubCategoryResponseEntity extends Equatable {
  final int results;
  final SubCategoryMetadataEntity metadata;
  final List<SubCategoryEntity> data;

  const SubCategoryResponseEntity({
    required this.results,
    required this.metadata,
    required this.data,
  });

  @override
  List<Object?> get props => [results, metadata, data];
}
