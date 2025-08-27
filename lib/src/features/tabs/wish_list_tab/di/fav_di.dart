import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/data/data_sources/fav_tab_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/data/repos/fav_tab_reo.imp.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/repos/favr_tab_reo.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/use_cases/get_fav_products_use_case.dart';

void favoritesProductsDI() {
  sl.registerLazySingleton<GetFavProductsUseCase>(
    () => GetFavProductsUseCase(sl<FavTabRepository>()),
  );
  sl.registerLazySingleton<FavTabRepository>(
    () => FavTabRepositoryImpl(sl<FavTabRemoteDataSource>()),
  );

  sl.registerLazySingleton<FavTabRemoteDataSource>(
    () => FavTabRemoteDataSourceImpl(),
  );
}
