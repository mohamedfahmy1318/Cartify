import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/language/locale_keys.g.dart';
import 'package:full_ecommerce_app/src/config/res/assets.gen.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/text_style_extensions.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/features/app_home/presentation/screens/app_home_screen.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/screens/login_screen.dart';

import '../../core/navigation/navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _initApp();
    super.initState();
  }

  void _initApp() async {
    final userCubit = sl<UserCubit>();
    final isLoggedIn = await userCubit.init();
    // NotificationNavigator(
    //   onRoutingMessage: (message) {
    //     NotificationRoutes.navigateByType(message.data);
    //   },
    //   onNoInitialMessage: () {
    //     Go.offAll(const HomeScreen()); // TODO Default Route when no notification
    //   },
    // ); // TODO add notification navigator
    // await ConstantManager.serviceLocator<NotificationService>()
    //     .setupNotifications(); //TODO add notification service
    Future.delayed(const Duration(seconds: 2), () {
      if (isLoggedIn) {
        Go.offAll(const AppHomeScreen());
      } else {
        Go.offAll(const LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: 1.sh,
        width: 1.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppAssets.lottie.cartify.lottie(
              height: 0.5.sh,
              filterQuality: FilterQuality.high,
              fit: BoxFit.contain,
              width: 0.55.sw,
            ),
            Text(
              LocaleKeys.welcomeCartify.tr(),
              style: const TextStyle().s28.setMainTextColor
                  .setFontWeight(FontWeight.bold)
                  .setLetterSpacing(1.5),
            ),
          ],
        ),
      ),
    );
  }
}
