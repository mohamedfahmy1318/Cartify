// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
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
                // Add to cart functionality
                // You can implement this based on your cart logic
                print('Add to cart: ${favProduct.title}');
              },
            ),
          );
        },
      ),
    );
  }
}

/*
ProductCard(
            onAddToCart: () {
              // Handle add to cart
            },
            onFavoriteToggle: () {
              // Handle favorite toggle
            },
            isFavorite: true,
            banner: const ProductEntity(
              id: '1',
              title: 'Sample Product',
              description: 'This is a sample product description.',
              imageCover:
                  'https://via.placeholder.com/150', // Placeholder image URL
              price: 29,
              sold: 100,
              images: [],
              subcategory: [],
              ratingsQuantity: 20,
              slug: '',
              quantity: 20,
              availableColors: [],
              category: CategoryEntity(
                id: '1',
                name: 'Sample Category',
                slug: 'sample-category',
                image: 'https://via.placeholder.com/150',
                createdAt: '',
                updatedAt: '',
              ),
              brand: BrandEntity(
                id: '1',
                name: 'Sample Brand',
                slug: 'sample-brand',
                image: 'https://via.placeholder.com/150',
              ),
              ratingsAverage: 3.2,
              createdAt: '',
              updatedAt: '',
            ),
          );*/
