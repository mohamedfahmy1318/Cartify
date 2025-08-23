import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/auth/register/data/data_sources/register_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/auth/register/data/repos/register_repo_imp.dart';
import 'package:full_ecommerce_app/src/features/auth/register/domain/repos/register_repo.dart';
import 'package:full_ecommerce_app/src/features/auth/register/domain/use_cases/register_use_case.dart';

void setupRegisterDI() {
  sl.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(sl<RegisterRepository>()),
  );

  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(sl<RegisterRemoteDataSource>()),
  );

  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(),
  );
}
