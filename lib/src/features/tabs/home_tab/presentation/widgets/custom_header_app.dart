import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/custom_search_app_field.dart';

class CustomHeaderApp extends StatelessWidget {
  const CustomHeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          'Cartify',
          fontSize: FontSize.s26,
          fontWeight: FontWeightManager.bold,
          color: AppColors.primary,
        ),
        12.szH,
        Row(
          children: [
            const CustomSearchAppField(),
            IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.primary,
                size: AppSize.sH25,
              ),
              onPressed: () {
                // Handle shopping cart icon press
              },
            ),
          ],
        ),
      ],
    );
  }
}
