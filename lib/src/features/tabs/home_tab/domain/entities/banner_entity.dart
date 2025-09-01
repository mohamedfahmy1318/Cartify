import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;

  const BannerEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, slug, image, createdAt, updatedAt];
}


