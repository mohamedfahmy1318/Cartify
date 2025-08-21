import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/language/locale_keys.g.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('${LocaleKeys.doNotHaveAnAccount.tr()}? '),
        GestureDetector(
          child: AppText(
            LocaleKeys.createAccount.tr(),
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }
}
