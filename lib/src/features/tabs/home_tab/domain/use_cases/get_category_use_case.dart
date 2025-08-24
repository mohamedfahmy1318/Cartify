import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/standard/use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/repos/get_home_tab_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetCategoryUseCase implements UseCase<List<CategoryEntity>, int?> {
  final GetHomeTabRepository _repository;

  GetCategoryUseCase(this._repository);

  @override
  Future<Result<List<CategoryEntity>, Failure>> call(int? limit) {
    return _repository.getCategories(limit: limit);
  }
}
