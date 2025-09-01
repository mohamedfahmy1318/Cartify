
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/data/data_sources/cart_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/data/repo/cart_repo_impl.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/repo/cart_repo.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/use_cases/add_to_cart_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/use_cases/get_all_cart_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/use_cases/remove_cart_item.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/use_cases/update_product_quentity.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';

void cartDI() {
  sl.registerLazySingleton<GetAllCartUseCase>(
    () => GetAllCartUseCase(sl<CartRepository>()),
  );
  sl.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(sl<CartRepository>()),
  );
  sl.registerLazySingleton<UpdateProductQuantityUseCase>(
    () => UpdateProductQuantityUseCase(sl<CartRepository>()),
  );
  sl.registerLazySingleton<RemoveCartItemUseCase>(
    () => RemoveCartItemUseCase(sl<CartRepository>()),
  );
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(sl<CartRemoteDataSource>()),
  );

  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(),
  );
  sl.registerFactory<CartCubit>(
    () => CartCubit(
      sl<GetAllCartUseCase>(),
      sl<AddToCartUseCase>(),
      sl<UpdateProductQuantityUseCase>(),
      sl<RemoveCartItemUseCase>(),
    ),
  );
}
