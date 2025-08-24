import 'package:full_ecommerce_app/src/core/network/dio_service.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/core/notification/notification_service.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/di/forgot_password_di.dart';
import 'package:full_ecommerce_app/src/features/auth/login/di/login_di.dart';
import 'package:full_ecommerce_app/src/features/auth/register/di/register_di.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/di/home_tab_di.dart';

import '../../../config/res/constants_manager.dart';

void setUpServiceLocator() {
  setUpGeneralDependencies();
  setupLoginDI();
  setupRegisterDI();
  setUpForgotPasswordDI();
  homeTabDI();
}

void setUpGeneralDependencies() {
  sl.registerLazySingleton<NetworkService>(() => DioService());

  sl.registerLazySingleton<UserCubit>(() => UserCubit());

  sl.registerFactory<NotificationService>(() => NotificationService());
}
