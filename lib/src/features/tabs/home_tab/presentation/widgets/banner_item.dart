import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';

class BannerItem extends StatelessWidget {
  const BannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 115.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppCircular.r10),
        image: const DecorationImage(
          image: AssetImage('assets/png/baner2.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
