import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_cubit.dart';
import 'config/themes/app_theme.dart';
import 'core/navigation/navigator.dart';
import 'core/navigation/route_generator.dart';
import 'core/shared/cubits/user_cubit/user_cubit.dart';
import 'core/shared/route_observer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(ScreenSizes.width, ScreenSizes.height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => sl<UserCubit>()..init()),
            BlocProvider(create: (context) => sl<FavoritesCubit>()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: ConstantManager.projectName,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            navigatorKey: Go.navigatorKey,
            onGenerateRoute: RouterGenerator.getRoute,
            home: const SplashScreen(),
            navigatorObservers: [AppNavigationObserver()],
            theme: AppTheme.light,
          ),
        );
      },
    );
  }
}
