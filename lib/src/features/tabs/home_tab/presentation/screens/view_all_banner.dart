import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/image_widgets/cached_image.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';

class ViewAllBanner extends StatefulWidget {
  const ViewAllBanner({super.key});

  @override
  State<ViewAllBanner> createState() => _ViewAllBannerState();
}

class _ViewAllBannerState extends State<ViewAllBanner> {
  late ScrollController _scrollController;
  late HomeTabCubit _cubit;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _cubit = context.read<HomeTabCubit>();

    // جلب الـ Banners عند فتح الصفحة
    _cubit.fetchBanners(limit: 12);
    // إضافة listener للـ Scroll للـ Pagination
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // لما المستخدم يوصل لآخر الصفحة
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // حمل المزيد من الـ Banners
      _cubit.loadMoreProducts(limit: 7); // حمل 7 banners إضافية
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.primary,
        title: Text(
          'All Brands',
          style: TextStyle(
            fontWeight: FontWeightManager.bold,
            fontSize: AppSize.sH16,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Go.back(),
          icon: Icon(Icons.arrow_back_ios_new_outlined, size: 25.w),
        ),
      ),
      body: BlocBuilder<HomeTabCubit, HomeTabState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              _cubit.refreshProducts(limit: 10);
            },
            child: _buildBody(state),
          );
        },
      ),
    );
  }

  Widget _buildBody(HomeTabState state) {
    // لو في loading وما فيش banners
    if (state.bannersStatus == BaseStatus.loading && state.banners.isEmpty) {
      return Center(child: CustomLoading.showLoadingView());
    }

    // لو في error وما فيش banners
    if (state.bannersStatus == BaseStatus.error && state.banners.isEmpty) {
      return const NotContainData();
    }

    // عرض الـ Banners مع الـ Pagination
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            controller: _scrollController,
            padding: EdgeInsets.all(10.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.7,
              crossAxisSpacing: 17.w,
              mainAxisSpacing: 17.h,
            ),
            itemCount: state.banners.length + (state.hasNextPage ? 1 : 0),
            itemBuilder: (context, index) {
              // لو وصلنا لآخر عنصر (Load More)
              if (index == state.banners.length) {
                return _buildLoadMoreIndicator(state.isLoadingMore);
              }
              // عرض الـ Banner
              return _buildBannerItem(state.banners[index]);
            },
          ),
        ),
      ],
    );
  }

  // Load More Indicator
  Widget _buildLoadMoreIndicator(bool isLoading) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.only(right: 10.h, bottom: 10.h),
      child: Column(
        children: [
          if (isLoading) ...[
            CustomLoading.showLoadingView(),
            SizedBox(height: 10.h),
          ] else ...[
            Icon(Icons.keyboard_arrow_down, color: AppColors.grey, size: 30.w),
            Text(
              'Scroll to load more',
              style: TextStyle(color: AppColors.grey, fontSize: AppSize.sH14),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildBannerItem(BannerEntity banner) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              // Handle banner tap if needed
              Go.toNamed(
                NamedRoutes.bannerProducts,
                arguments: {"id": banner.id, "name": banner.name},
              );
            },
            child: Container(
              width: 90.w,
              height: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.grey.withOpacity(0.2)),
              ),
              child: CachedImage(
                fit: BoxFit.contain,
                url: banner.image,
                borderColor: AppColors.primary,
                borderWidth: .32,
                haveRadius: true,
              ),
            ),
          ),

          // سهم
        ],
      ),
    );
  }
}
