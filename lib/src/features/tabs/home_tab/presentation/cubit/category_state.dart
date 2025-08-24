import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';

final class CategoryState extends Equatable {
  final BaseStatus baseStatus;
  final List<CategoryEntity> categories;
  final String errorMessage;

  const CategoryState({
    required this.baseStatus,
    required this.categories,
    this.errorMessage = ConstantManager.emptyText,
  });

  factory CategoryState.initial() {
    return const CategoryState(baseStatus: BaseStatus.initial, categories: []);
  }

  CategoryState copyWith({
    BaseStatus? baseStatus,
    List<CategoryEntity>? categories,
    String? errorMessage,
  }) {
    return CategoryState(
      baseStatus: baseStatus ?? this.baseStatus,
      categories: categories ?? this.categories,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [baseStatus, categories, errorMessage];
}
