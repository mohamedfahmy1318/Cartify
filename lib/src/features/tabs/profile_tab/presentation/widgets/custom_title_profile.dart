import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class CustomTitleProfile extends StatelessWidget {
  const CustomTitleProfile({
    required this.icon,
    required this.title,
    super.key,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
         icon,
          size: 18.sp,
          color: AppColors.grey,
        ),
        5.szW,
        AppText(
          title,
          maxLines: 2,
          overflow: TextOverflow.fade,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
      ],
    );
  }
}
