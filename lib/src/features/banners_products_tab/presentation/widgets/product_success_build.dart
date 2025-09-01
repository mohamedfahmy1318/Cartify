import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/widgets/product_card.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_cubit.dart';

class ProductSuccessBuild extends StatelessWidget {
  const ProductSuccessBuild({
    super.key,
    required this.product,
    required this.isFav,
  });

  final ProductEntity product;
  final bool isFav;

  @override
  Widget build(BuildContext context) {
    return ProductCard(
      onFavoriteToggle: () {
        context
            .read<FavoritesCubit>()
            .toggleFavorite(
              FavEntity(
                id: product.id,
                title: product.title,
                price: product.price,
                imageCover: product.imageCover,
                brand: product.brand,
                category: product.category,
                ratingsAverage:
                    product.ratingsAverage,
                description: product.description,
                images: product.images,
                quantity: product.quantity,
                createdAt: product.createdAt,
                ratingsQuantity:
                    product.ratingsQuantity,
                slug: product.slug,
                sold: product.sold,
                subcategory: product.subcategory,
                updatedAt: product.updatedAt,
              ),
            );
        MessageUtils.showSimpleToast(
          msg: isFav
              ? 'Removed from favorites '
              : 'Added to favorites',
          color: isFav ? Colors.red : Colors.green,
          context,
        );
      },
      onAddToCart: () {
        context
            .read<CartCubit>()
            .addToCart(product.id );
        MessageUtils.showSimpleToast(
          msg: 'Added to cart',
          color: Colors.green,
          context,
        );
      },
      isFavorite: context
          .read<FavoritesCubit>()
          .isFavorite(product.id),
      product: product,
    );
  }
}
