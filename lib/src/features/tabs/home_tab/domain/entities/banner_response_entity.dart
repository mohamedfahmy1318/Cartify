import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_entity.dart';

class BannerMetadataEntity extends Equatable {
  final int currentPage;
  final int numberOfPages;
  final int limit;
  final int? nextPage;

  const BannerMetadataEntity({
    required this.currentPage,
    required this.numberOfPages,
    required this.limit,
    this.nextPage,
  });

  @override
  List<Object?> get props => [currentPage, numberOfPages, limit, nextPage];
}

class BannerResponseEntity extends Equatable {
  final int results;
  final BannerMetadataEntity metadata;
  final List<BannerEntity> data;

  const BannerResponseEntity({
    required this.results,
    required this.metadata,
    required this.data,
  });

  @override
  List<Object?> get props => [results, metadata, data];
}
