import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/auth/login/data/data_sources/login_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/auth/login/data/repos/login_repo_imp.dart';
import 'package:full_ecommerce_app/src/features/auth/login/domain/repos/login_repo.dart';
import 'package:full_ecommerce_app/src/features/auth/login/domain/use_cases/login_use_case.dart';

void setupLoginDI() {
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<LoginRepository>()),
  );

  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(sl<LoginRemoteDataSource>()),
  );

  sl.registerLazySingleton<LoginRemoteDataSource>(
    () => LoginRemoteDataSourceImpl(),
  );
}
