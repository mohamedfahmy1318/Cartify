import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            return SizedBox(
              height: 120.h, // Fixed height for loading state
              child: CustomLoading.showLoadingView(),
            );
          case BaseStatus.success:
            return _buildSuccessList(state);
          case BaseStatus.error:
            return SizedBox(
              height: 120.h, // Fixed height for error state
              child: const NotContainData(),
            );
          case BaseStatus.initial:
            return const SizedBox();
        }
      },
    );
  }

  Widget _buildSuccessList(HomeTabState state) {
    if (state.banners.isEmpty) {
      return SizedBox(
        height: 45.h,
        child: const NotContainData(),
      );
    }
    
    return SizedBox(
      height: 40.h, // Changed from 36.h to 40.h to show banners properly
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.banners.length,
        itemBuilder: (context, index) {
          final banner = state.banners[index];
          return BannerItem(banner: banner);
        },
      ),
    );
  }
}