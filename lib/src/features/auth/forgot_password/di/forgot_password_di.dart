import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/data_soursces/forgot_password_remote_ds.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/repo/forgot_password_repo_imp.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/repo/forgot_password_repo.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/use_case/forgot_password_use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/use_case/rese_code_use_case.dart';

void setUpForgotPasswordDI() {
  sl.registerLazySingleton<ForgotPasswordUseCase>(
    () => ForgotPasswordUseCase(sl<ForgotPasswordRepository>()),
  );

  sl.registerLazySingleton<ForgotPasswordRepository>(
    () => ForgotPasswordRepositoryImpl(sl<ForgotPasswordRemoteDataSource>()),
  );

  sl.registerLazySingleton<ForgotPasswordRemoteDataSource>(
    () => ForgotPasswordRemoteDataSourceImpl(),
  );
  //resetCode
  sl.registerLazySingleton<ResetCodeUseCase>(
    () => ResetCodeUseCase(sl<ForgotPasswordRepository>()),
  );
}
