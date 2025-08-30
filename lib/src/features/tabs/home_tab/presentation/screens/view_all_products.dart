import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/widgets/product_card.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/custom_search_app_field.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/tab_hom__header_app.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/entities/fav_entity.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_cubit.dart';

class ViewAllProducts extends StatefulWidget {
  const ViewAllProducts({super.key});

  @override
  State<ViewAllProducts> createState() => _ViewAllProductsState();
}

class _ViewAllProductsState extends State<ViewAllProducts> {
  late ScrollController _scrollController;
  late HomeTabCubit _cubit;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _cubit = context.read<HomeTabCubit>();

    // جلب الـ Products عند فتح الصفحة
    _cubit.fetchProducts(limit: 5);
    // إضافة listener للـ Scroll للـ Pagination
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // لما المستخدم يوصل لآخر الصفحة
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // حمل المزيد من الـ Products
      _cubit.loadMoreProducts(limit: 5); // حمل 12 منتجات إضافية
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
        backgroundColor: AppColors.white,
        title: Text(
          'All Products',
          style: TextStyle(
            fontWeight: FontWeightManager.bold,
            fontSize: AppSize.sH16,
            color: AppColors.primary,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Go.back(),
          color: AppColors.primary,
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
    // لو في loading وما فيش products
    if (state.productsStatus == BaseStatus.loading && state.products.isEmpty) {
      return Center(child: CustomLoading.showLoadingView());
    }

    // لو في error وما فيش products
    if (state.productsStatus == BaseStatus.error && state.products.isEmpty) {
      return const NotContainData();
    }

    // عرض الـ Banners مع الـ Pagination
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Column(
        children: [
          Expanded(flex: 1, child: const CustomSearchAppField(titleSearch: 'Search Products')),
          Expanded(
            flex: 10,
            child: GridView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(10.w),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 17.w,
                mainAxisSpacing: 17.h,
              ),
              itemCount: state.products.length + (state.hasNextPage ? 1 : 0),
              itemBuilder: (context, index) {
                // لو وصلنا لآخر عنصر (Load More)
                if (index == state.products.length) {
                  return _buildLoadMoreIndicator(state.isLoadingMore);
                }
                final product = state.products[index];
                final favoritesCubit = context.watch<FavoritesCubit>();
                bool isFav = favoritesCubit.isFavorite(product.id);
                // عرض الـ Product
                return GestureDetector(
                  onTap: () {
                    // Navigate to product details
                    Go.toNamed(NamedRoutes.productDetail, arguments: product.id);
                  },
                  child: ProductCard(
                    product: state.products[index],
                    onFavoriteToggle: () {
                      context.read<FavoritesCubit>().toggleFavorite(
                        FavEntity(
                          id: product.id,
                          title: product.title,
                          price: product.price,
                          imageCover: product.imageCover,
                          brand: product.brand,
                          category: product.category,
                          ratingsAverage: product.ratingsAverage,
                          description: product.description,
                          images: product.images,
                          quantity: product.quantity,
                          createdAt: product.createdAt,
                          ratingsQuantity: product.ratingsQuantity,
                          slug: product.slug,
                          sold: product.sold,
                          subcategory: product.subcategory,
                          updatedAt: product.updatedAt,
                        ),
                      );
                      MessageUtils.showSimpleToast(
                        msg: isFav
                            ? 'Removed from favorites '
                            : 'Added to favorites',
                        color: isFav ? Colors.red : Colors.green,
                        context,
                      );
                    },
                    onAddToCart: () {
                      // Add your cart logic here
                    },
                    isFavorite: context.read<FavoritesCubit>().isFavorite(
                      product.id,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
}
