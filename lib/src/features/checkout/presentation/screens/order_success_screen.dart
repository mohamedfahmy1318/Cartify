import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/checkout_entity.dart';
import 'package:lottie/lottie.dart';

class OrderSuccessScreen extends StatefulWidget {
  static const String routeName = '/order-success';
  
  final CheckoutEntity? orderDetails;
  
  const OrderSuccessScreen({
    super.key,
    this.orderDetails,
  });

  @override
  State<OrderSuccessScreen> createState() => _OrderSuccessScreenState();
}

class _OrderSuccessScreenState extends State<OrderSuccessScreen> {
  @override
  void initState() {
    super.initState();
    HapticFeedback.mediumImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        automaticallyImplyLeading: false, // Remove back button
        title: AppText(
          'Order Confirmation',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            10.szH,
            // Success Animation
            Container(
              width: 170.w,
              height: 145.h,
              child: Lottie.asset(
                'assets/lottie/successfull_order.json',
                repeat: false,
                fit: BoxFit.contain,
              ),
            ),
 
            7.szH,
            
            // Success Message
            AppText(
              'تمام!',
              fontSize: 23.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            
            3.szH,
            
            AppText(
              'Your Order Has Been Placed Successfully',
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              textAlign: TextAlign.center,
            ),
            
            3.szH,
            
            AppText(
              'Thank you for shopping with us!',
              fontSize: 14.sp,
              color: AppColors.grey,
              textAlign: TextAlign.center,
            ),
            
            10.szH,
            
            // Order Details Card
            if (widget.orderDetails != null) ...[
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.2),
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Order Details',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.black,
                    ),
                    
                    8.szH,
                    
                    _buildDetailRow(
                      'Order ID:', 
                      '#${widget.orderDetails!.orderNumber}',
                    ),
                    
                    8.szH,
                    
                    _buildDetailRow(
                      'Total Amount:', 
                      '${widget.orderDetails!.totalOrderPrice.toStringAsFixed(0)} EGP',
                    ),
                    
                    8.szH,
                    
                    _buildDetailRow(
                      'Payment Method:', 
                      widget.orderDetails!.paymentMethodType == 'cash' 
                          ? 'Cash on Delivery' 
                          : widget.orderDetails!.paymentMethodType,
                    ),
                    
                    8.szH,
                    
                    _buildDetailRow(
                      'Delivery Address:', 
                      '${widget.orderDetails!.shippingAddress.city}, ${widget.orderDetails!.shippingAddress.details}',
                    ),
                    
                    8.szH,
                    
                    _buildDetailRow(
                      'Items Count:', 
                      '${widget.orderDetails!.cartItems.length} item(s)',
                    ),
                  ],
                ),
              ),
              
              10.szH,
            ],
                      
            // Action Buttons
            Column(
              children: [
                DefaultButton(
                  title: 'Continue Shopping',
                  onTap: () {
                    // Navigate to home/products page
                    Go.offAllNamed(NamedRoutes.appHome);
               
                  },
                  height: 50.h,
                  color: AppColors.primary,
                ),
                
                5.szH,
                
                DefaultButton(
                  title: 'Track Your Order',
                  onTap: () {
                    // Navigate to orders/tracking page
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Order tracking coming soon!'),
                      ),
                    );
                  },
                  height: 50.h,
                  color: AppColors.white,
                  borderColor: AppColors.primary,
                  textColor: AppColors.primary,
                ),
              ],
            ),
            
            5.szH,
          ],
        ),
      ),
    );
  }
  
  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120.w,
          child: AppText(
            label,
            fontSize: 12.sp,
            color: AppColors.grey,
          ),
        ),
        Expanded(
          child: AppText(
            value,
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }
}
