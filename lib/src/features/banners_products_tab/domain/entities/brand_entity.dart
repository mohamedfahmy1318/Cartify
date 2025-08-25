import 'package:equatable/equatable.dart';

class BrandEntity extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String image;

  const BrandEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
  });

  @override
  List<Object?> get props => [id, name, slug, image];
}
