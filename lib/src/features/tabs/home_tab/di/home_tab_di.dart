import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/data_sources/home_tab_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/repos/get_category_repo_impl.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/repos/get_category_repo.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_category_use_case.dart';

void homeTabDI() {
  sl.registerLazySingleton<GetCategoryUseCase>(
    () => GetCategoryUseCase(sl<GetCategoryRepository>()),
  );

  sl.registerLazySingleton<GetCategoryRepository>(
    () => GetCategoryRepositoryImpl(sl<HomeTabRemoteDataSource>()),
  );

  sl.registerLazySingleton<HomeTabRemoteDataSource>(
    () => HomeTabRemoteDataSourceImpl(),
  );
}
