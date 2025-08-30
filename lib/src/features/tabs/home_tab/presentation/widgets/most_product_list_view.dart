import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/widgets/product_card.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_cubit.dart';

class MostProductListView extends StatelessWidget {
  const MostProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabState>(
      builder: (context, state) {
        switch (state.productsStatus) {
          case BaseStatus.loading:
            return SizedBox(
              height: 240.h,
              child: CustomLoading.showLoadingView(),
            );
          case BaseStatus.success:
            return _buildSuccessList(state);
          case BaseStatus.error:
            return SizedBox(
              height: 240.h,
              child: const NotContainData(),
            );
          case BaseStatus.initial:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildSuccessList(HomeTabState state) {
    if (state.products.isEmpty) {
      return SizedBox(
        height: 200.h,
        child: const NotContainData(),
      );
    }
    
    return SizedBox(
      height: 180.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: state.products.length,
        itemBuilder: (context, index) {
          final product = state.products[index];
          final favoritesCubit = context.watch<FavoritesCubit>();
        bool isFav = favoritesCubit.isFavorite(product.id);
          return Container(
            width: 135.w, // Fixed width for each card
            margin: EdgeInsets.only(right: 12.w), // Spacing between cards
            child: GestureDetector(
              onTap: () {
                Go.toNamed(NamedRoutes.productDetail, arguments: product.id);
              },
              child: ProductCard(
                product: product,
                onFavoriteToggle: () {
                  context.read<FavoritesCubit>().toggleFavorite(
                    FavEntity(
                      id: product.id,
                      title: product.title,
                      price: product.price,
                      imageCover: product.imageCover,
                      brand: product.brand,
                      category: product.category,
                      ratingsAverage: product.ratingsAverage,
                      description: product.description,
                      images: product.images,
                      quantity: product.quantity,
                      createdAt: product.createdAt,
                      ratingsQuantity: product.ratingsQuantity,
                      slug: product.slug,
                      sold: product.sold,
                      subcategory: product.subcategory,
                      updatedAt: product.updatedAt,
                    ),
                  );
                    MessageUtils.showSimpleToast(
                  msg: isFav ? 'Removed from favorites ' : 'Added to favorites',
                  color: isFav ? Colors.red : Colors.green,
                  context,
                );
                },
                onAddToCart: () {
                  // Add your cart logic here
                },
                isFavorite: context.read<FavoritesCubit>().isFavorite(product.id),
              ),
            ),
          );
        },
      ),
    );
  }
}