import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/helpers/location_notifier.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/custom_search_app_field.dart';

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
    setState(() {
      TabHomeHeader.currentLocation = _locationNotifier.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        Row(
          children: [
            CustomSearchAppField(titleSearch: widget.titleSearch),
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
                if ((context
                        .watch<CartCubit>()
                        .state
                        .cartResponseEntity
                        ?.numOfCartItems ??
                    0) >
                    0)
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
