import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/banner_item.dart';

class BannerListView extends StatelessWidget {
  const BannerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabState>(
      builder: (context, state) {
        switch (state.bannersStatus) {
          case BaseStatus.loading:
            return CustomLoading.showLoadingView();
          case BaseStatus.success:
            return _buildSuccessList(state);
          case BaseStatus.error:
            return const NotContainData();
          case BaseStatus.initial:
            return _buildInitialWidget();
        }
      },
    );
  }

  Widget _buildSuccessList(HomeTabState state) {
    if (state.banners.isEmpty) {
      return const NotContainData();
    }
    return SizedBox(
      height: 36.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        itemCount: state.banners.length,
        itemBuilder: (context, index) {
          final banner = state.banners[index];
          return BannerItem(banner: banner);
        },
      ),
    );
  }

  Widget _buildInitialWidget() {
    return const Expanded(
      child: Center(
        child: Text(
          'Tap to load Banners',
          style: TextStyle(fontSize: 16, color: AppColors.grey),
        ),
      ),
    );
  }
}
