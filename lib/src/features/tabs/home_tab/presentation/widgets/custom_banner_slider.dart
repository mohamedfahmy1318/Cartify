import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/assets.gen.dart';

class CustomBannerSlider extends StatelessWidget {
  final List<String> images = [
    AppAssets.png.baner1.path,
    AppAssets.png.baner2.path,
    AppAssets.png.baner3.path,
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 100.h,
        autoPlay: false,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: images.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(url, fit: BoxFit.cover, width: double.infinity),
        );
      }).toList(),
    );
  }
}
