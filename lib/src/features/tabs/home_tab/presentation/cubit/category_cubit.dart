import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_category_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.fetchCategoriesUseCase) : super(CategoryState.initial());
  final GetCategoryUseCase fetchCategoriesUseCase;

  void fetchCategories({int? limit}) async {
    emit(state.copyWith(baseStatus: BaseStatus.loading));

    final result = await fetchCategoriesUseCase.call(limit);
    result.when(
      (success) => emit(
        state.copyWith(baseStatus: BaseStatus.success, categories: success),
      ),
      (error) => emit(
        state.copyWith(
          baseStatus: BaseStatus.error,
          errorMessage: error.message,
        ),
      ),
    );
  }
}
