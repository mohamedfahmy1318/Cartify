import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class AppBarCheckout extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCheckout({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      centerTitle: true,
      title: AppText(
        'Checkout',
        fontSize: 20.sp,
        color: AppColors.primary,
        fontWeight: FontWeight.w600,
      ),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColors.primary,
          size: 24.sp,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
