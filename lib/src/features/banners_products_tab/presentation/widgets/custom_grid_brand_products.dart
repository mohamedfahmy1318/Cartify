import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/cubit/brand_product_cubit.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/cubit/brand_products_state.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/widgets/product_card.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category_grid_view.dart';

class CustomGridBrandProduct extends StatelessWidget {
  const CustomGridBrandProduct({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandProductCubit, BrandProductState>(
      builder: (context, state) {
        switch (state.productsStatus) {
          case BaseStatus.initial:
            return buildInitialWidget();
          case BaseStatus.loading:
            return CustomLoading.showLoadingView();
          case BaseStatus.success:
            return _buildSuccessGrid(state);
          case BaseStatus.error:
            return const NotContainData();
        }
      },
    );
  }

  Widget _buildSuccessGrid(BrandProductState state) {
    if (state.productsBannerEntity.isEmpty) {
      return const NotContainData();
    }
    return GridView.builder(
      padding: EdgeInsets.all(AppPadding.pH16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.w,
        childAspectRatio: 0.7,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 16.h,
      ),
      itemCount: state.productsBannerEntity.length,
      itemBuilder: (context, index) {
        final productbrand = state.productsBannerEntity[index];
        return GestureDetector(
          onTap: () {
            // Handle product tap
            Go.toNamed(NamedRoutes.productDetail, arguments: productbrand.id);
            print(productbrand.id);
          },
          child: ProductCard(
            banner: productbrand,
            onFavoriteToggle: () {
              // Toggle favorite state
            },
            onAddToCart: () {},
            isFavorite: false,
          ),
        );
      },
    );
  }
}
