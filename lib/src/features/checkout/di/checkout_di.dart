import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/data_sourcse/check_out_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/repo/check_out_repo_impl.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/repo/check_out_repo.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/add_address_use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/create_cash_order_use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/delete_address_use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/get_all_address._use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/checkout_cubit.dart';

void checkoutDI() {
  sl.registerLazySingleton<GetAllAddressUseCase>(
    () => GetAllAddressUseCase(sl<CheckoutRepository>()),
  );
  sl.registerLazySingleton<AddAddressUseCase>(
    () => AddAddressUseCase(sl<CheckoutRepository>()),
  );

  sl.registerLazySingleton<DeleteAddressUseCase>(
    () => DeleteAddressUseCase(sl<CheckoutRepository>()),
  );
  sl.registerLazySingleton<CheckoutRepository>(
    () => CheckoutRepositoryImpl(sl<CheckoutRemoteDataSource>()),
  );

  sl.registerLazySingleton<CheckoutRemoteDataSource>(
    () => CheckoutRemoteDataSourceImpl(),
  );
  sl.registerFactory<AddressCubit>(
    () => AddressCubit(
      sl<GetAllAddressUseCase>(),
      sl<AddAddressUseCase>(),
      sl<DeleteAddressUseCase>(),
    ),
  );
  sl.registerLazySingleton<CreateCashOrderUseCase>(
    () => CreateCashOrderUseCase(sl<CheckoutRepository>()),
  );
  sl.registerFactory<CheckoutCubit>(
    () => CheckoutCubit(
      sl<CreateCashOrderUseCase>(),
    ),
  );
}
