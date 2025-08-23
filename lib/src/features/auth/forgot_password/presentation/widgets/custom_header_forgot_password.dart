import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class CustomHeaderForgotPassword extends StatelessWidget {
  const CustomHeaderForgotPassword({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        55.szH,
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: AppColors.primary,
          iconSize: AppSize.sH30,
        ),
        AppText(title, color: AppColors.primary, fontSize: FontSize.s24),
        8.szH,
        AppText(description, color: AppColors.shadow, fontSize: FontSize.s13),
        50.szH,
      ],
    );
  }
}
