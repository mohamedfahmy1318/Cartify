import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/cubit/brand_product_cubit.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/cubit/brand_products_state.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/widgets/custom_grid_brand_products.dart';

class BannerProductsScreen extends StatefulWidget {
  const BannerProductsScreen({
    super.key,
    required this.brandId,
    required this.brandName,
  });

  final String brandId;
  final String brandName;

  @override
  State<BannerProductsScreen> createState() => _BannerProductsScreenState();
}

class _BannerProductsScreenState extends State<BannerProductsScreen> {
  late ScrollController _scrollController;
  late BrandProductCubit _brandProductCubit;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _brandProductCubit = context.read<BrandProductCubit>();
    _brandProductCubit.fetchProducts(widget.brandId, limit: 10);
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      _brandProductCubit.loadMoreProducts(widget.brandId, limit: 7);
    }
  }

  Widget _buildBody(BrandProductState state) {
    // لو في loading وما فيش banners
    if (state.productsStatus == BaseStatus.loading &&
        state.productsBannerEntity.isEmpty) {
      return Center(child: CustomLoading.showLoadingView());
    }

    // لو في error وما فيش banners
    if (state.productsStatus == BaseStatus.error &&
        state.productsBannerEntity.isEmpty) {
      return const NotContainData();
    }
    return const CustomGridBrandProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        title: AppText(
          '${widget.brandName} Products',
          fontSize: FontSize.s18,
          fontWeight: FontWeightManager.medium,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.white),
          onPressed: () {
            Go.back();
          },
        ),
      ),
      body: BlocBuilder<BrandProductCubit, BrandProductState>(
        builder: (context, state) {
          return _buildBody(state);
        },
      ),
    );
  }
}
 /*
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
 */