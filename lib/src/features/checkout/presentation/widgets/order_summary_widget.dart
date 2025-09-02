import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class OrderSummaryWidget extends StatelessWidget {
  const OrderSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          AppText(
            'Order Summary',
            fontSize: FontSize.s18,
            fontWeight: FontWeightManager.bold,
            color: AppColors.whiteGrey,
          ),
          5.szH,

          // Items count
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Items (4)',
                fontSize: FontSize.s14,
                color: AppColors.grey,
              ),
              AppText(
                '\$299.96',
                fontSize: FontSize.s14,
                fontWeight: FontWeightManager.medium,
                color: AppColors.black,
              ),
            ],
          ),
              2.szH,

          // Shipping
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Shipping',
                fontSize: FontSize.s14,
                color: AppColors.grey,
              ),
              AppText(
                'FREE',
                fontSize: FontSize.s14,
                fontWeight: FontWeightManager.medium,
                color: const Color(0xFF4CAF50),
              ),
            ],
          ),
              2.szH,

          // Tax
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Tax',
                fontSize: FontSize.s14,
                color: AppColors.grey,
              ),
              AppText(
                'No Tax',
                fontSize: FontSize.s14,
                fontWeight: FontWeightManager.medium,
                color: const Color(0xFF4CAF50),
              ),
            ],
          ),
              2.szH,

          // Divider
          Divider(color: AppColors.grey.withOpacity(0.2)),

          // Total
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Total',
                fontSize: FontSize.s16,
                fontWeight: FontWeightManager.bold,
                color: AppColors.black,
              ),
              AppText(
                '\$323.95',
                fontSize: FontSize.s18,
                fontWeight: FontWeightManager.bold,
                color: AppColors.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
