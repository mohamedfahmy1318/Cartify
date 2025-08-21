import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/language/locale_keys.g.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            // Handle forgot password action
            // For example, navigate to a forgot password screen
          },
          child: AppText(
            "${LocaleKeys.forgotPassword.tr()}?",
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
