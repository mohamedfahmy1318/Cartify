import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/image_widgets/cached_image.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/entities/products_entity.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/domain/use_cases/get_product_details_use_case.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/cubit/product_details/product_details_cubit.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/cubit/product_details/products_details_state.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductDetailsCubit(sl<GetProductDetailsUseCase>())
            ..fetchProducts(productId),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: AppText(
            'Product Details',
            fontSize: FontSize.s18,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
          backgroundColor: AppColors.primary,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            return state.productsStatus.when(
              onLoading: () => CustomLoading.showLoadingView(),
              onError: () => const NotContainData(),
              onSuccess: () =>
                  _buildProductDetails(context, state.productEntity),
              onInitial: () => CustomLoading.showLoadingView(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildProductDetails(BuildContext context, ProductEntity product) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          _buildProductImage(product),
          10.szH,
          // Product Title and Brand
          AppText(
            product.title,
            fontSize: FontSize.s20,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            maxLines: 2,
          ),
          4.szH,

          AppText(
            'Brand: ${product.brand.name}',
            fontSize: FontSize.s14,
            fontWeight: FontWeight.w500,
            color: AppColors.primary,
          ),
          16.szH,

          // Rating and Price
          Row(
            children: [
              Icon(Icons.star, color: Colors.orange, size: 20.r),
              2.szW,
              AppText(
                '${product.ratingsAverage} (${product.ratingsQuantity} reviews)',
                fontSize: FontSize.s14,
                color: AppColors.grey,
              ),
              const Spacer(),
              AppText(
                '\$${product.price - 380}',
                fontSize: FontSize.s24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ],
          ),
          10.szH,

          // Description
          if (product.description.isNotEmpty) ...[
            AppText(
              'Description',
              fontSize: FontSize.s16,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            8.szH,
            ReadMoreText(
              product.description,
              trimMode: TrimMode.Line,

              trimLines: 4,
              colorClickableText: Colors.pink,
              trimCollapsedText: 'Show More',
              trimExpandedText: 'Show Less',
              moreStyle: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            15.szH,
          ],

          // Stock Info
          Row(
            children: [
              AppText(
                'In Stock: ${product.quantity}',
                fontSize: FontSize.s14,
                color: product.quantity > 0
                    ? AppColors.primary
                    : AppColors.error,
                fontWeight: FontWeight.w500,
              ),
              const Spacer(),
              AppText(
                'Sold: ${product.sold}',
                fontSize: FontSize.s14,
                color: AppColors.grey,
              ),
            ],
          ),
          15.szH,

          // Add to Cart Button
          DefaultButton(
            title: product.quantity > 0 ? 'Add to Cart' : 'Out of Stock',
            onTap: product.quantity > 0
                ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Added to cart!'),
                        backgroundColor: AppColors.primary,
                      ),
                    );
                  }
                : null,
            color: product.quantity > 0 ? AppColors.primary : AppColors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(ProductEntity product) {
    final images = product.images.isNotEmpty
        ? product.images
        : [product.imageCover];

    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
      ),
      items: images.map((url) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.r),
          child: CachedImage(url: url),
        );
      }).toList(),
    );
  }
}
