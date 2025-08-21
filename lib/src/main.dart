import 'package:full_ecommerce_app/src/app.dart';
import 'package:full_ecommerce_app/src/config/language/languages.dart';
import 'package:full_ecommerce_app/src/core/helpers/cache_service.dart';
import 'package:full_ecommerce_app/src/core/navigation/constants/imports_constants.dart';
import 'package:full_ecommerce_app/src/core/navigation/page_router/implementation/imports_page_router.dart';
import 'package:full_ecommerce_app/src/core/navigation/page_router/imports_page_router_builder.dart';
import 'package:full_ecommerce_app/src/core/navigation/transition/implementation/fade/Option/fade_animation_option.dart';
import 'package:full_ecommerce_app/src/core/network/backend_configuation.dart';
import 'package:full_ecommerce_app/src/core/shared/Functions/setup_service_locators.dart';
import 'package:full_ecommerce_app/src/core/shared/bloc_observer.dart';
import 'package:full_ecommerce_app/src/core/widgets/exeption_view.dart';
import 'package:flutter/foundation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    CacheStorage.init(),
  ]);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  setUpServiceLocator();
  BackendConfiguration.setBackendType(BackendType.php);
  PageRouterBuilder().initAppRouter(
    config: PlatformConfig(
      android: CustomPageRouterCreator(
        parentTransition: TransitionType.fade,
        parentOptions: const FadeAnimationOptions(
          duration: Duration(milliseconds: 300),
        ),
      ),
    ),
  );
  if (kReleaseMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) =>
        const ExceptionView();
  }
  runApp(
    EasyLocalization(
      supportedLocales: Languages.supportedLocales,
      path: 'assets/translations',
      //fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const App(),
    ),
  );
}
