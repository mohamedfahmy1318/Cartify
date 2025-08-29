import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/data_sources/home_tab_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/data/repos/get_home_tab_repo_impl.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/repos/get_home_tab_repo.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_banners_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_category_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_products_use_case.dart';

void homeTabDI() {
  sl.registerLazySingleton<GetCategoryUseCase>(
    () => GetCategoryUseCase(sl<GetHomeTabRepository>()),
  );

  sl.registerLazySingleton<GetBannersUseCase>(
    () => GetBannersUseCase(sl<GetHomeTabRepository>()),
  );
  sl.registerLazySingleton<GetProductsUseCase>(
    () => GetProductsUseCase(sl<GetHomeTabRepository>()),
  );
  sl.registerLazySingleton<GetHomeTabRepository>(
    () => GetHomeTabRepositoryImpl(sl<HomeTabRemoteDataSource>()),
  );

  sl.registerLazySingleton<HomeTabRemoteDataSource>(
    () => HomeTabRemoteDataSourceImpl(),
  );
}
