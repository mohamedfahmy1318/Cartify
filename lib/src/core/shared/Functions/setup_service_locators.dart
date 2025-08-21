import 'package:full_ecommerce_app/src/core/network/dio_service.dart';
import 'package:full_ecommerce_app/src/core/network/network_service.dart';
import 'package:full_ecommerce_app/src/core/notification/notification_service.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/features/auth/login/di/login_di.dart';

import '../../../config/res/constants_manager.dart';
import '../../../features/home/di/home_di.dart';

void setUpServiceLocator() {
  setUpHomeDependencies();
  setUpGeneralDependencies();
  setupLoginDI();
}

void setUpGeneralDependencies() {
  sl.registerLazySingleton<NetworkService>(() => DioService());

  sl.registerLazySingleton<UserCubit>(() => UserCubit());

  sl.registerFactory<NotificationService>(() => NotificationService());
}
