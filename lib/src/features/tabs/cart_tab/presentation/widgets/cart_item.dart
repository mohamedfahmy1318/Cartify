import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/core/widgets/image_widgets/cached_image.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/domain/entities/cart_response_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/widgets/quantity_btn.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.cartItem});
  final CartItemEntity cartItem;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  late int currentCount;

  @override
  void initState() {
    super.initState();
    currentCount = widget.cartItem.count ?? 0;
  }

  @override
  void didUpdateWidget(CartItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Update local count when widget updates from external sources
    if (widget.cartItem.count != oldWidget.cartItem.count) {
      currentCount = widget.cartItem.count ?? 0;
    }
  }

  void _removeItem() {
    // Show confirmation dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          title: AppText(
            'Remove Item',
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
          ),
          content: AppText(
            'Are you sure you want to remove this item from your cart?',
            fontSize: 14.sp,
            color: AppColors.grey,
          ),
          actions: [
            TextButton(
              onPressed: () => Go.back(),
              child: AppText('Cancel', fontSize: 16.sp, color: AppColors.grey),
            ),
            TextButton(
              onPressed: () {
                Go.back();
                _confirmRemove();
              },
              child: AppText(
                'Remove',
                fontSize: 16.sp,
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        );
      },
    );
  }

  void _confirmRemove() {
    // Make API call to remove item
    context.read<CartCubit>().removeCartItem(widget.cartItem.product!.id);

    // Show success message
    MessageUtils.showSnackBar("Item removed from cart");
  }

  void _updateQuantity(int newCount) {
    if (newCount <= 0) return; // Prevent negative quantities

    setState(() {
      currentCount = newCount;
    });

    // Make API request
    context.read<CartCubit>().updateProductQuantity(
      widget.cartItem.product!.id,
      newCount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 24,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            // Product Image
            Container(
              width: 90.w,
              height: 90.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: AppColors.grey.withOpacity(0.1),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedImage(
                  url: widget.cartItem.product!.imageCover,
                  fit: BoxFit.cover,
                  haveRadius: false,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            // Product Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  AppText(
                    widget.cartItem.product!.title,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  // Price
                  AppText(
                    '${(widget.cartItem.price ?? 0) * currentCount} EGP',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 12.h),
                  // Quantity and Delete Row with better spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Enhanced Quantity Controls
                      Container(
                        decoration: BoxDecoration(
                          color: AppColors.scaffoldBackground,
                          borderRadius: BorderRadius.circular(25.r),
                          border: Border.all(
                            color: AppColors.primary.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            buildQuantityButton(
                              icon: Icons.remove,
                              onTap: () => _updateQuantity(currentCount - 1),
                              isEnabled: currentCount > 1,
                            ),
                            Container(
                              width: 40.w,
                              height: 36.h,
                              alignment: Alignment.center,
                              child: Text(
                                currentCount.toString(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primary,
                                ),
                              ),
                            ),
                            buildQuantityButton(
                              icon: Icons.add,
                              onTap: () => _updateQuantity(currentCount + 1),
                              isEnabled: true,
                            ),
                          ],
                        ),
                      ),
                      // Enhanced Delete Button
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: AppColors.error.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: IconButton(
                          onPressed: _removeItem,
                          icon: Icon(
                            Icons.delete_outline,
                            size: 20.sp,
                            color: AppColors.error,
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


}
