// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/widgets/product_fav_card.dart';

class CustomListFavoritesProducts extends StatefulWidget {
  final List<FavEntity> favorites;

  const CustomListFavoritesProducts({super.key, required this.favorites});

  @override
  State<CustomListFavoritesProducts> createState() =>
      _CustomListFavoritesProductsState();
}

class _CustomListFavoritesProductsState
    extends State<CustomListFavoritesProducts> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
        ),
        itemCount: widget.favorites.length,
        itemBuilder: (context, index) {
          final favProduct = widget.favorites[index];

          return GestureDetector(
            onTap: () {
              if (favProduct.id != null) {
                Go.toNamed(NamedRoutes.productDetail, arguments: favProduct.id);
              }
            },
            child: ProductFavCard(
              favEntity: favProduct,
              isFavorite: true, // Always true since it's in favorites list
              onFavoriteToggle: () {
                context.read<FavoritesCubit>().removeProductFromFavorites(
                  favProduct.id ?? '',
                );
                MessageUtils.showSimpleToast(
                  msg: 'Removed from favorites',
                  color: AppColors.error,
                  context,
                );
              },
              onAddToCart: () {
                context.read<CartCubit>().addToCart(favProduct.id ?? '');
                MessageUtils.showSimpleToast(
                  msg: 'Added to cart',
                  color: Colors.green,
                  context,
                );
              
                    },
            ),
          );
        },
      ),
    );
  }
}

