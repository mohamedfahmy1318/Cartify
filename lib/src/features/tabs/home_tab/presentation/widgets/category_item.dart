import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/image_widgets/cached_image.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/category_entity.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.category});
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: AppColors.grey.withOpacity(.05),
        borderRadius: BorderRadius.circular(AppCircular.r20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 3,
            child: CachedImage(
              url: category.image,
              width: 60.w,
              height: 50.h,
              fit: BoxFit.contain,
              borderRadius: BorderRadius.circular(AppCircular.r10),
              bgColor: AppColors.primary,
              boxShape: BoxShape.rectangle,
            ),
          ),
          SizedBox(height: 8.h),
          Flexible(
            flex: 1,
            child: Text(
              category.name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeightManager.medium,
                fontSize: 12.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
