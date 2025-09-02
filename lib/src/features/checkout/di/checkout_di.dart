import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/data_sourcse/address_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/repo/addres_repo_impl.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/repo/address_repo.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/add_address_use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/use_cases/get_all_address._use_case.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_cubit.dart';

void checkoutDI() {
  sl.registerLazySingleton<GetAllAddressUseCase>(
    () => GetAllAddressUseCase(sl<AddressRepository>()),
  );
  sl.registerLazySingleton<AddAddressUseCase>(
    () => AddAddressUseCase(sl<AddressRepository>()),
  );

  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(sl<AddressRemoteDataSource>()),
  );

  sl.registerLazySingleton<AddressRemoteDataSource>(
    () => AddressRemoteDataSourceImpl(),
  );
  sl.registerFactory<AddressCubit>(
    () => AddressCubit(
      sl<GetAllAddressUseCase>(),
      sl<AddAddressUseCase>(),
    ),
  );
}
