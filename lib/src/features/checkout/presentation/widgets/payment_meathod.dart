import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class OrderPaymentMethod extends StatefulWidget {
  final Function(String)? onPaymentMethodChanged;
  
  const OrderPaymentMethod({
    super.key,
    this.onPaymentMethodChanged,
  });

  @override
  State<OrderPaymentMethod> createState() => _OrderPaymentMethodState();
}

class _OrderPaymentMethodState extends State<OrderPaymentMethod> {
  String _selectedPaymentMethod = 'cash'; // Default to cash

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
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
            'Payment Method',
            fontSize: FontSize.s18,
            fontWeight: FontWeightManager.bold,
            color: AppColors.hintText,
          ),
          8.szH,

          // Cash on Delivery Option
          _buildPaymentOption(
            value: 'cash',
            title: 'Cash on Delivery',
            subtitle: 'Pay when you receive your order',
            icon: Icons.money_rounded,
            isSelected: _selectedPaymentMethod == 'cash',
            onTap: () => _selectPaymentMethod('cash'),
          ),
          12.szH,

          // Card Payment Option
          _buildPaymentOption(
            value: 'card',
            title: 'Credit/Debit Card',
            subtitle: 'Pay securely with your card',
            icon: Icons.credit_card_rounded,
            isSelected: _selectedPaymentMethod == 'card',
            onTap: () => _selectPaymentMethod('card'),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption({
    required String value,
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : AppColors.grey.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : AppColors.grey.withOpacity(0.2),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            // Radio Button
            Container(
              width: 20.w,
              height: 20.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.grey,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Container(
                      margin: EdgeInsets.all(3.r),
                      // ignore: prefer_const_constructors
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary,
                      ),
                    )
                  : null,
            ),
            12.szW,

            // Icon
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withOpacity(0.2)
                    : AppColors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.grey,
                size: 20.r,
              ),
            ),
            12.szW,

            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    fontSize: FontSize.s16,
                    fontWeight: FontWeightManager.medium,
                    color: AppColors.black,
                  ),
                  2.szH,
                  AppText(
                    subtitle,
                    fontSize: FontSize.s12,
                    color: AppColors.grey,
                  ),
                ],
              ),
            ),

            // Checkmark for selected
            if (isSelected)
              Icon(
                Icons.check_circle_rounded,
                color: AppColors.primary,
                size: 20.r,
              ),
          ],
        ),
      ),
    );
  }

  void _selectPaymentMethod(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
    
    // Notify parent widget about the selection change
    if (widget.onPaymentMethodChanged != null) {
      widget.onPaymentMethodChanged!(method);
    }
  }
}
