import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/data_sources/get_products_banners.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/data/repos/get_brand_products_repo_impl.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/repos/get_brand_products_repo.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/use_cases/get_brand_products_use_case.dart';

void brandProductsDI() {
  sl.registerLazySingleton<GetBrandProductsUseCase>(
    () => GetBrandProductsUseCase(sl<GetBrandProductsRepo>()),
  );
  sl.registerLazySingleton<GetBrandProductsRepo>(
    () => GetBrandProductsRepoImpl(sl<GetProductsBannersDataSource>()),
  );

  sl.registerLazySingleton<GetProductsBannersDataSource>(
    () => GetProductsBannersDataSourceImpl(),
  );
}
