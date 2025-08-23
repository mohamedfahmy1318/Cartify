import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/language/locale_keys.g.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/screens/login_screen.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Have an account? '),
        GestureDetector(
          onTap: () {
            Go.off(const LoginScreen());
          },
          child: AppText(LocaleKeys.startNow.tr(), color: AppColors.primary),
        ),
      ],
    );
  }
}
