import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/features/app_home/presentation/screens/app_home_screen.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/screens/pin_code_screen.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/screens/login_screen.dart';
import 'package:full_ecommerce_app/src/features/auth/register/presentation/screens/register_screen.dart';
import 'named_routes.dart';
import 'page_router/imports_page_router_builder.dart';

class RouterGenerator {
  RouterGenerator._();

  static final PageRouterBuilder _pageRouter = PageRouterBuilder();

  static Route<dynamic> getRoute(RouteSettings settings) {
    final namedRoute = NamedRoutes.values.firstWhere(
      (e) => e.routeName == settings.name,
    );
    return switch (namedRoute) {
      NamedRoutes.login => _pageRouter.build(
        const LoginScreen(),
        settings: settings,
      ),
      NamedRoutes.appHome => _pageRouter.build(
        const AppHomeScreen(),
        settings: settings,
      ),
      NamedRoutes.register => _pageRouter.build(
        const RegisterScreen(),
        settings: settings,
      ),
      NamedRoutes.pinCode => _pageRouter.build(
        const PinCodeScreen(),
        settings: settings,
      ),
    };
  }

  static Route<dynamic> undefineRoute() {
    return MaterialPageRoute(
      builder: (_) =>
          const Scaffold(body: Center(child: Text('No route exists here ! '))),
    );
  }
}
