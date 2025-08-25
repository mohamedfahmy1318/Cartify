import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/assets.gen.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';

class BannerProductsScreen extends StatefulWidget {
  const BannerProductsScreen({
    super.key,
    required this.bannerId,
    required this.bannerName,
  });

  final int bannerId;
  final String bannerName;

  @override
  State<BannerProductsScreen> createState() => _BannerProductsScreenState();
}

class _BannerProductsScreenState extends State<BannerProductsScreen> {
  List<bool> favoriteStates = List.generate(10, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppText(
          widget.bannerName,
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.medium,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: AppColors.white),
            onPressed: () {
              // Handle search
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(AppPadding.pH16),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.w,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 16.h,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCard(
            onFavoriteToggle: () {
              setState(() {
                favoriteStates[index] = !favoriteStates[index];
              });
            },
            onAddToCart: () {
              _showAddToCartSnackBar('Nike Air Jordan');
            },
            isFavorite: favoriteStates[index],
          );
        },
      ),
    );
  }

  void _showAddToCartSnackBar(String productName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: AppText(
          'تم إضافة $productName إلى السلة',
          color: AppColors.white,
          fontSize: FontSize.s14,
        ),
        backgroundColor: AppColors.primary,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.onFavoriteToggle,
    required this.onAddToCart,
    required this.isFavorite,
  });

  final VoidCallback onFavoriteToggle;
  final VoidCallback onAddToCart;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image Section
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    color: Colors.grey[50],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(16.r),
                    ),
                    child: Image.asset(
                      AppAssets.png.banner4.path,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[100],
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported_outlined,
                              color: AppColors.grey,
                              size: 40.r,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Favorite Button
                Positioned(
                  top: 8.h,
                  right: 8.w,
                  child: GestureDetector(
                    onTap: onFavoriteToggle,
                    child: Container(
                      padding: EdgeInsets.all(6.r),
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shadow.withOpacity(0.2),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : AppColors.grey,
                        size: 18.r,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Product Details Section
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.r, vertical: 8.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Product Name
                  AppText(
                    'Nike Air Jordan',
                    fontSize: FontSize.s13,
                    fontWeight: FontWeightManager.medium,
                    color: AppColors.black,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    height: 1.1,
                  ),

                  SizedBox(height: 4.h),

                  // Rating
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 12.r),
                      SizedBox(width: 2.w),
                      AppText(
                        '4.5',
                        fontSize: FontSize.s10,
                        fontWeight: FontWeightManager.medium,
                        color: AppColors.grey,
                      ),
                      SizedBox(width: 2.w),
                      AppText(
                        '(124)',
                        fontSize: FontSize.s10,
                        color: AppColors.grey,
                      ),
                    ],
                  ),

                  const Spacer(),

                  // Price and Add to Cart
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Price
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppText(
                              'EGP 1,000',
                              fontSize: FontSize.s14,
                              color: AppColors.primary,
                              fontWeight: FontWeightManager.bold,
                            ),
                            Text(
                              'EGP 1,300',
                              style: TextStyle(
                                fontSize: FontSize.s10,
                                color: AppColors.grey,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Add to Cart Button
                      GestureDetector(
                        onTap: onAddToCart,
                        child: Container(
                          padding: EdgeInsets.all(6.r),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(6.r),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withOpacity(0.3),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.white,
                            size: 16.r,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
