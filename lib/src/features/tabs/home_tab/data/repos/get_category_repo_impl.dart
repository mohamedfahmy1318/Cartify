import 'package:full_ecommerce_app/src/core/error/failure.dart';
import 'package:full_ecommerce_app/src/core/extensions/error_handler_extension.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/data_sources/home_tab_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/repos/get_category_repo.dart';
import 'package:multiple_result/multiple_result.dart';

class GetCategoryRepositoryImpl implements GetCategoryRepository {
  final HomeTabRemoteDataSource remoteDataSource;

  GetCategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<List<CategoryEntity>, Failure>> getCategories({int? limit}) {
    return remoteDataSource
        .getCategories(limit: limit)
        .handleCallbackWithFailure();
  }
}
