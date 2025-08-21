import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/assets.gen.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/screens/login_screen.dart';
import 'package:full_ecommerce_app/src/features/home/presentation/imports/presentaion_imports.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      Go.offAll(const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 1.sh,
      width: 1.sw,
      child: Center(
        child: AppAssets.svg.logo.svg(height: 0.3.sh, width: 0.3.sw),
      ),
    );
  }
}
