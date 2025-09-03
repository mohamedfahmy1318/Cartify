
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/data_sources/profile_tab_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/repo/profile_tab_repository_impl.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/domain/repositories/profile_tab_repository.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/domain/use_cases/update_password_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/cubit/update_password_cubit.dart';

void profileDI() {

  sl.registerLazySingleton<UpdatePasswordUseCase>(
    () => UpdatePasswordUseCase(sl<ProfileTabRepository>()),
  );
  sl.registerLazySingleton<ProfileTabRepository>(
    () => ProfileTabRepositoryImpl(sl<ProfileTabRemoteDataSource>()),
  );

  sl.registerLazySingleton<ProfileTabRemoteDataSource>(
    () => ProfileTabRemoteDataSourceImpl(),
  );
  sl.registerFactory<ProfileTabCubit>(
    () => ProfileTabCubit(
      sl<UpdatePasswordUseCase>(),
      sl<UserCubit>(),
    ),
  );
}
