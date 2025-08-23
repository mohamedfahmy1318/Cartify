import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/banner_item.dart';

class BannerListView extends StatelessWidget {
  const BannerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        separatorBuilder: (context, index) => 10.szW,
        itemBuilder: (context, index) {
          return const BannerItem();
        },
      ),
    );
  }
}
