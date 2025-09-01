import 'package:equatable/equatable.dart';

class SubCategoryEntity extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String createdAt;
  final String updatedAt;

  const SubCategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, name, slug, createdAt, updatedAt];
}

