import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        //color: AppColors.grey.withOpacity(.05),
        borderRadius: BorderRadius.circular(AppCircular.r20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/png/baner3.png'),
          10.szH,
          Text(
            'Category ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeightManager.medium,
            ),
          ),
        ],
      ),
    );
  }
}
