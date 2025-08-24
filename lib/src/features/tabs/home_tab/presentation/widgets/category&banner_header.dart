import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';

class CategoryAndBannerHeader extends StatelessWidget {
  const CategoryAndBannerHeader({super.key, this.onTap, required this.title});
  final void Function()? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: AppColors.hintText),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'View All',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: AppColors.hintText),
          ),
        ),
      ],
    );
  }
}
