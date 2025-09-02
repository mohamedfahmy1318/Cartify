import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class AddAndRemoveButton extends StatelessWidget {
  const AddAndRemoveButton({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44.w,
        height: 27.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: AppText(title,
          fontSize: 14.sp,
          color: AppColors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}