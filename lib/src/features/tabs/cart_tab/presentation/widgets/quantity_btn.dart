  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';

Widget buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
    required bool isEnabled,
  }) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        width: 36.w,
        height: 36.h,
        decoration: BoxDecoration(
          color: isEnabled
              ? AppColors.primary
              : AppColors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Icon(
          icon,
          size: 18.sp,
          color: isEnabled ? AppColors.white : AppColors.grey,
        ),
      ),
    );
  }