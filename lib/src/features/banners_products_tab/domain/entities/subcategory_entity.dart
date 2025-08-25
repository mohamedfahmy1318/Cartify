import 'package:equatable/equatable.dart';

class SubcategoryEntity extends Equatable {
  final String id;
  final String name;
  final String slug;
  final String category;

  const SubcategoryEntity({
    required this.id,
    required this.name,
    required this.slug,
    required this.category,
  });

  @override
  List<Object?> get props => [id, name, slug, category];
}
