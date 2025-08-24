import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';
import 'package:multiple_result/multiple_result.dart';

abstract class GetCategoryRepository {
  Future<Result<List<CategoryEntity>, Failure>> getCategories({int? limit});
}
