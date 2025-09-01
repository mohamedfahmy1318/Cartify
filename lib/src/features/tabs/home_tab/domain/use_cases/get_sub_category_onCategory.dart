import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/sub_category_response.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/repos/get_home_tab_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetSubCategoryUseCase {
  final GetHomeTabRepository _repository;

  GetSubCategoryUseCase(this._repository);

  Future<Result<SubCategoryResponseEntity, Failure>> call(String categoryId) {
    return _repository.getSubCategoriesFromCategory(categoryId);
  }
}
