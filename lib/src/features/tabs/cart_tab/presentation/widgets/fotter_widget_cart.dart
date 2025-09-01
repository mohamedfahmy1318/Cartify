import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/entities/cart_response_entity.dart';

class FooterWidgetCart extends StatelessWidget {
  const FooterWidgetCart({
    super.key,
    required this.cartEntity,
  });
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          'Total: \$${cartEntity.totalCartPrice}',
          fontSize: 19.sp,
          fontWeight: FontWeight.w800,
          color: AppColors.black,
        ),
        const Spacer(),
        DefaultButton(
          title: 'Checkout',
          fontSize: 15.sp,
          width: 160.w,
          height: 35.h,
          isFitted: true,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
          onTap: () {},
        ),
      ],
    );
  }
}