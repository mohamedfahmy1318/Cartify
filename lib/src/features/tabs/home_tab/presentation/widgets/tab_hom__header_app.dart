import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/helpers/location_notifier.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';

class TabHomeHeader extends StatefulWidget {
  final String titleSearch;
  static String? currentLocation;

  const TabHomeHeader({super.key, required this.titleSearch});

  @override
  State<TabHomeHeader> createState() => _TabHomeHeaderState();
}

class _TabHomeHeaderState extends State<TabHomeHeader> {
  final _locationNotifier = LocationNotifier();

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    await _locationNotifier.fetchLocation();
    if (mounted) {
      setState(() {
        TabHomeHeader.currentLocation = _locationNotifier.value;
      });
    }
  }

  @override
  void dispose() {
    // لو LocationNotifier يحتاج dispose
    try {
      _locationNotifier.dispose();
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Top row: logo + location
        Row(
          children: [
            AppText(
              'Cartify',
              fontSize: FontSize.s26,
              fontWeight: FontWeightManager.bold,
              color: AppColors.primary,
            ),
            const Spacer(),
            AppText(
              TabHomeHeader.currentLocation ?? "Loading...",
              fontSize: FontSize.s13,
              fontWeight: FontWeightManager.medium,
              color: AppColors.grey,
            ),
            const Icon(Icons.location_on_outlined, color: AppColors.grey),
          ],
        ),

        12.szH,

        // New header middle row:
        Row(
          children: [
            // REPLACED: Search field -> Static Promo Card
            const Expanded(
              child: HeaderPromoCard(
                title: 'اكتشف أفضل العروض',
                subtitle: 'تخفيضات و توصيل فوري • تصفح الآن',
              ),
            ),

            // Cart icon with badge
            Stack(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: AppColors.primary,
                    size: AppSize.sH25,
                  ),
                  onPressed: () {
                    // Handle shopping cart icon press
                  },
                ),
                if ((context.watch<CartCubit>().state.cartResponseEntity?.numOfCartItems ?? 0) > 0)
                  Positioned(
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: AppText(
                        context
                                .watch<CartCubit>()
                                .state
                                .cartResponseEntity
                                ?.numOfCartItems
                                .toString() ??
                            '0',
                        fontSize: FontSize.s12,
                        fontWeight: FontWeightManager.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

/// ----- HeaderPromoCard: عنصر ثابت جميل بديل للبحث -----
class HeaderPromoCard extends StatelessWidget {
  final String title;
  final String subtitle;

  const HeaderPromoCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.hintText.withOpacity(0.5),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          // Icon bubble
          Container(
            width: 44.h,
            height: 44.h,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Center(
              child: Icon(
                Icons.local_offer_outlined,
                color: AppColors.white,
                size: AppSize.sH20,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          // Titles
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: FontSize.s15,
                  fontWeight: FontWeightManager.bold,
                  color: AppColors.white,
                ),
                AppText(
                  subtitle,
                  fontSize: FontSize.s12,
                  fontWeight: FontWeightManager.bold,
                  color: AppColors.white.withOpacity(0.92),
                ),
              ],
            ),
          ),
      
        ],
      ),
    );
  }
}
