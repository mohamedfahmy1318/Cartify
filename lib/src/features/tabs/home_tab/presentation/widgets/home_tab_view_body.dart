import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class HomeTabViewBody extends StatelessWidget {
  const HomeTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [CustomHeaderApp()]);
  }
}

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
        Row(
          children: [
            CustomSearchAppField(),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: AppColors.primary),
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

class CustomSearchAppField extends StatelessWidget {
  const CustomSearchAppField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
