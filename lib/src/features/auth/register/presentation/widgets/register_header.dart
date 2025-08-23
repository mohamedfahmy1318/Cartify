import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        30.szH,
        Center(
          child: AppText(
            'Cartify',
            color: AppColors.primary,
            fontSize: 35.sp,
            height: 30.0 / 10,
            fontWeight: FontWeightManager.bold,
          ),
        ),
        AppText(
          'Now Register To Cartify',
          color: AppColors.secondary,
          fontSize: FontSize.s26,
        ),
      ],
    );
  }
}
