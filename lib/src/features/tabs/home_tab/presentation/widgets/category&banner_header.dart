import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';

class CategoryAndBannerHeader extends StatelessWidget {
  const CategoryAndBannerHeader({super.key, this.onTap, required this.title, required this.showViewAll});
  final void Function()? onTap;
  final String title;
  final bool showViewAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.hintText, fontSize: 18.sp,fontWeight: FontWeight.w700 ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            showViewAll
                ? 'View All'
                : '',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppColors.hintText, fontSize: 18.sp,fontWeight: FontWeight.w700 ),
          ),
        ),
      ],
    );
  }
}
