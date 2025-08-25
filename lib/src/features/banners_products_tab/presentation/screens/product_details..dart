/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/assets.gen.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';

class BannerProductsScreen extends StatefulWidget {
  const BannerProductsScreen({super.key});

  @override
  State<BannerProductsScreen> createState() => _BannerProductsScreenState();
}

class _BannerProductsScreenState extends State<BannerProductsScreen> {
  bool isFavorite = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppText(
          'Product Details',
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
            icon: const Icon(Icons.share, color: AppColors.white),
            onPressed: () {
              // Handle share action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppPadding.pH16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image Section
            Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.sH16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(AppSize.sH16),
                    child: Image.asset(
                      AppAssets.png.banner4.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 12.h,
                    right: 12.w,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.r),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow.withOpacity(0.2),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : AppColors.grey,
                          size: 24.r,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 12.h,
                    left: 12.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: AppText(
                        '23% OFF',
                        color: AppColors.white,
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            20.szH,

            // Product Title
            AppText(
              'Nike Air Jordan Retro High OG',
              fontSize: FontSize.s24,
              fontWeight: FontWeightManager.bold,
              color: AppColors.black,
              maxLines: 2,
            ),

            8.szH,

            // Brand
            AppText(
              'Nike',
              fontSize: FontSize.s16,
              color: AppColors.grey,
              fontWeight: FontWeightManager.medium,
            ),

            16.szH,

            // Price Section
            Row(
              children: [
                AppText(
                  'EGP 1,000',
                  fontSize: FontSize.s28,
                  fontWeight: FontWeightManager.bold,
                  color: AppColors.primary,
                ),
                12.szW,
                Text(
                  'EGP 1,300',
                  style: TextStyle(
                    fontSize: FontSize.s18,
                    color: AppColors.grey,
                    fontWeight: FontWeightManager.medium,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),

            16.szH,

            // Rating Section
            Row(
              children: [
                Row(
                  children: List.generate(5, (index) {
                    return Icon(
                      index < 4 ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 20.r,
                    );
                  }),
                ),
                8.szW,
                AppText(
                  '4.8',
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.medium,
                  color: AppColors.black,
                ),
                4.szW,
                AppText(
                  '(124 reviews)',
                  fontSize: FontSize.s14,
                  color: AppColors.grey,
                ),
              ],
            ),

            24.szH,

            // Size Selection
            AppText(
              'Size',
              fontSize: FontSize.s18,
              fontWeight: FontWeightManager.medium,
              color: AppColors.black,
            ),

            12.szH,

            SizedBox(
              height: 50.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ['38', '39', '40', '41', '42', '43'].length,
                itemBuilder: (context, index) {
                  final sizes = ['38', '39', '40', '41', '42', '43'];
                  final isSelected = index == 2; // Default selected size 40

                  return Container(
                    margin: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: () {
                        // Handle size selection
                      },
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.white,
                          border: Border.all(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.border,
                            width: 1.5,
                          ),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Center(
                          child: AppText(
                            sizes[index],
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.medium,
                            color: isSelected
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            24.szH,

            // Quantity Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  'Quantity',
                  fontSize: FontSize.s18,
                  fontWeight: FontWeightManager.medium,
                  color: AppColors.black,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: const Icon(Icons.remove),
                        color: AppColors.primary,
                      ),
                      Container(
                        width: 40.w,
                        child: Center(
                          child: AppText(
                            quantity.toString(),
                            fontSize: FontSize.s16,
                            fontWeight: FontWeightManager.medium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(Icons.add),
                        color: AppColors.primary,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            24.szH,

            // Description
            AppText(
              'Description',
              fontSize: FontSize.s18,
              fontWeight: FontWeightManager.medium,
              color: AppColors.black,
            ),

            8.szH,

            AppText(
              'The Nike Air Jordan Retro High OG brings you the iconic look and legendary comfort that started it all. Premium materials and classic colorways deliver the excellence you expect.',
              fontSize: FontSize.s14,
              color: AppColors.grey,
              height: 1.5,
              maxLines: 4,
            ),

            32.szH,
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(AppPadding.pH16),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.shadow.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              Expanded(
                child: DefaultButton(
                  title: 'Add to Cart',
                  onTap: () {
                    // Handle add to cart
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: AppText(
                          'Added to cart successfully!',
                          color: AppColors.white,
                        ),
                        backgroundColor: AppColors.primary,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    );
                  },
                  color: AppColors.primary,
                  textColor: AppColors.white,
                  height: 56.h,
                  fontSize: FontSize.s16,
                  fontWeight: FontWeightManager.medium,
                ),
              ),
              16.szW,
              Container(
                width: 56.w,
                height: 56.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary, width: 2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: IconButton(
                  onPressed: () {
                    // Handle buy now
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.primary,
                    size: 24.r,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/
