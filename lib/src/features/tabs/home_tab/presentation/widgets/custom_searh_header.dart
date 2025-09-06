import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/helpers/location_notifier.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';

class CustomHeader extends StatefulWidget {
  final String titleSearch;
  static String? currentLocation;

  const CustomHeader({super.key, required this.titleSearch});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  final _locationNotifier = LocationNotifier();

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    await _locationNotifier.fetchLocation();
    setState(() {
      CustomHeader.currentLocation = _locationNotifier.value;
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
              CustomHeader.currentLocation ?? "Loading...",
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
            Container(
              alignment: Alignment.center,
              width: 280.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.hintText.withOpacity(0.09),
              ),
              child: Text(
                widget.titleSearch,
                style: TextStyle(
                  fontSize: FontSize.s19,
                  fontWeight: FontWeightManager.medium,
                  color: AppColors.primary,
                ),
              ),
            ),
            const Spacer(),
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
