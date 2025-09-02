import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/add_delete_btn.dart';

class CustomCardAddress extends StatelessWidget {
  const CustomCardAddress({
    super.key,
    required this.addressIndex,
    required this.isSelected,
    required this.onAddressSelected,
    required this.addressEntity,
  });

  final int addressIndex;
  final bool isSelected;
  final Function(int) onAddressSelected;
  final AddressEntity addressEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAddressSelected(addressIndex),
      child: SizedBox(
        width: 280.w, // Fixed width for horizontal scrolling
        child: Card(
          color: isSelected ? AppColors.primary : AppColors.hintText,
          elevation: isSelected ? 4 : 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: isSelected
                ? BorderSide(color: AppColors.white.withOpacity(0.5), width: 2)
                : BorderSide.none,
          ),
          child: Padding(
            padding: EdgeInsets.all(12.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Radio button and address info row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Radio<int>(
                    value: addressIndex,
                    groupValue: isSelected ? addressIndex : -1,
                    onChanged: (value) {
                      if (value != null) {
                        onAddressSelected(value);
                      }
                    },
                    activeColor: AppColors.white,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  6.szW,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          addressEntity.name??"No Name",
                          fontSize: 13.sp,
                          color: AppColors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        2.szH,
                        AppText(
                          addressEntity.city??"No City",
                          fontSize: 11.sp,
                          color: AppColors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                         2.szH,
                        AppText(
                          addressEntity.details??"No Details",
                          fontSize: 11.sp,
                          color: AppColors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w400,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        2.szH,
                        AppText(
                          addressEntity.phone??"No Phone",
                          fontSize: 11.sp,
                          color: AppColors.white.withOpacity(0.9),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              15.szH,
              // Action buttons row
              Row(
                children: [
                  Expanded(
                    child: AddAndRemoveButton(
                      title: 'Edit',
                      onTap: () {
                        // Handle edit button tap
                      },
                    ),
                  ),
                  8.szW,
                  Expanded(
                    child: AddAndRemoveButton(
                      title: 'Delete',
                      onTap: () {
                        // Handle remove button tap
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
