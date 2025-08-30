import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/banner_list_view.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category_grid_view.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category&banner_header.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/custom_banner_slider.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/most_product_list_view.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/tab_hom__header_app.dart';

class HomeTabViewBody extends StatelessWidget {
  const HomeTabViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: AppPadding.pH10,
          horizontal: AppPadding.pW12,
        ),
        child: Column(
          children: [
                        10.szH,

            const TabHomHeader(titleSearch: 'Search products...'),
            10.szH,
  
            CustomBannerSlider(),
          10.szH,
            CategoryAndBannerHeader(
              title: 'Categories',
              onTap: () {
                Go.toNamed(NamedRoutes.viewAllCategory);
              },
            ),
            5.szH, // Reduced spacing
            
            // Make sure CategoryGridView has intrinsic height
            const CategoryGridView(),
            4.szH,
            
            CategoryAndBannerHeader(
              title: 'Brands',
              onTap: () {
                Go.toNamed(NamedRoutes.viewAllBanners);
              },
            ),
            9.szH, // Reduced spacing
            
            const BannerListView(),
            8.szH,
            
            CategoryAndBannerHeader(
              title: 'Most Priced',
              onTap: () {
                // Handle view all products tap
                //Go.toNamed(NamedRoutes.viewAllProducts);
              },
            ),
            
            const MostProductListView(),
          ],
        ),
      ),
    );
  }
}