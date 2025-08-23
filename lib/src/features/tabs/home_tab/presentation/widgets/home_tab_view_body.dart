import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/banner_list_view.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category_grid_view.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category&banner_header.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/custom_banner_slider.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/custom_header_app.dart';

class HomeTabViewBody extends StatelessWidget {
  const HomeTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppPadding.pH14,
        horizontal: AppPadding.pW16,
      ),
      child: Column(
        children: [
          const CustomHeaderApp(),
          15.szH,
          CustomBannerSlider(),
          20.szH,
          CategoryAndBannerHeader(
            title: 'Categories',
            onTap: () {
              // Handle view all tap
            },
          ),
          9.szH,
          const CategoryGridView(),
          CategoryAndBannerHeader(
            title: 'Banners',
            onTap: () {
              // Handle view all tap
            },
          ),
          const BannerListView(),
        ],
      ),
    );
  }
}
