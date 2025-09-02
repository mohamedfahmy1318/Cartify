import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class AppTextCheckout extends StatelessWidget {
  const AppTextCheckout({
    required this.text,
    this.color,
    super.key,
  });
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      fontSize: 16.sp,
      color: color ?? AppColors.hintText,
      fontWeight: FontWeightManager.bold,
    );
  }
}

