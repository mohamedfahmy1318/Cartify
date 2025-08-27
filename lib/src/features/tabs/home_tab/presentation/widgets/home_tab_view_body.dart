import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/banner_list_view.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category_grid_view.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category&banner_header.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/custom_banner_slider.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/tab_hom__header_app.dart';

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
          TabHomHeader(titleSearch: 'Search products...'),
          10.szH,
          CustomBannerSlider(),
          10.szH,
          CategoryAndBannerHeader(
            title: 'Categories',
            onTap: () {
              Go.toNamed(NamedRoutes.viewAllCategory);
            },
          ),
          const CategoryGridView(),
          CategoryAndBannerHeader(
            title: 'Brands',
            onTap: () {
              // Handle view all banners tap
              Go.toNamed(NamedRoutes.viewAllBanners);
            },
          ),
          const BannerListView(),
        ],
      ),
    );
  }
}
