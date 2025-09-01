import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/banners_products_tab/presentation/widgets/product_success_build.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category_item.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/tab_hom__header_app.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_cubit.dart';


class CategoriesTabBody extends StatefulWidget {
  const CategoriesTabBody({super.key});

  @override
  State<CategoriesTabBody> createState() => _CategoriesTabBodyState();
}

class _CategoriesTabBodyState extends State<CategoriesTabBody>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  String? selectedCategoryId;
  String? selectedSubCategoryId;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<HomeTabCubit>();
    cubit.fetchCategories(); // تحميل Categories أول ما الشاشة تتحمل
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<HomeTabCubit, HomeTabState>(
        builder: (context, state) {
          // ----- Categories Status -----
          if (state.categoriesStatus == BaseStatus.loading) {
            return CustomLoading.showLoadingView();
          } else if (state.categoriesStatus == BaseStatus.error) {
            return const NotContainData();
          } else if (state.categoriesStatus == BaseStatus.initial ||
              state.categories.isEmpty) {
            return const AppText('No categories available');
          }

          final categories = state.categories;

          // ----- init TabController -----
          if (_tabController == null || _tabController!.length != categories.length) {
            _tabController = TabController(length: categories.length, vsync: this);

            // لما المستخدم يغير Category
            _tabController!.addListener(() {
              if (!_tabController!.indexIsChanging) {
                setState(() {
                  selectedCategoryId = categories[_tabController!.index].id;
                  selectedSubCategoryId = null;
                });
                context.read<HomeTabCubit>().fetchSubCategories(selectedCategoryId!);
              }
            });

            // اختار أول Category أول ما تتحمل
            selectedCategoryId = categories[0].id;
            context.read<HomeTabCubit>().fetchSubCategories(selectedCategoryId!);
          }

          return Column(
            children: [
              const TabHomeHeader(titleSearch: 'Search Products'),

              // ----- Categories Tabs -----
              TabBar(
                controller: _tabController,
                isScrollable: true,
                indicatorColor: AppColors.primary,
                tabs: categories.map((category) => CategoryItem(category: category)).toList(),
              ),

              // ----- SubCategories / Products Display -----
              Expanded(
                child: BlocBuilder<HomeTabCubit, HomeTabState>(
                  builder: (context, state) {
                    // SubCategories Loading/Error
                    if (state.subCategoriesStatus == BaseStatus.loading) {
                      return CustomLoading.showLoadingView();
                    } else if (state.subCategoriesStatus == BaseStatus.error) {
                      return const NotContainData();
                    } else if (state.subCategoriesStatus == BaseStatus.success &&
                        state.subCategories.isNotEmpty) {
                      
                      // ----- عرض SubCategories -----
                      if (selectedSubCategoryId == null) {
                        return GridView.builder(
                          padding: const EdgeInsets.all(12),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 3 / 2,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                          itemCount: state.subCategories.length,
                          itemBuilder: (context, index) {
                            final subCat = state.subCategories[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedSubCategoryId = subCat.id;
                                });
                                context.read<HomeTabCubit>().fetchProducts(
                                      categoryId: selectedCategoryId!,
                                      subCategoryId: selectedSubCategoryId!,
                                    );
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                elevation: 3,
                                color: AppColors.primary,
                                child: Center(
                                  child: Padding(
                                    padding:  EdgeInsets.all(8.0.w),
                                    child: Text(
                                      subCat.name,
                                      textAlign: TextAlign.center,
                                      style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }

                      // ----- عرض المنتجات -----
                      else {
                        return Column(
                          children: [
                            // زر رجوع + اسم SubCategory
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    color: AppColors.primary,
                                    icon: const Icon(Icons.arrow_back),
                                    onPressed: () {
                                      setState(() {
                                        selectedSubCategoryId = null;
                                      });
                                    },
                                  ),
                                  Expanded(
                                    child: Text(
                                      state.subCategories
                                          .firstWhere((sub) => sub.id == selectedSubCategoryId)
                                          .name,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // Products Grid
                            Expanded(
                              child: state.productsStatus == BaseStatus.loading
                                  ? CustomLoading.showLoadingView()
                                  : state.productsStatus == BaseStatus.error
                                      ? const NotContainData()
                                      : state.products.isEmpty
                                          ? const AppText('No products available')
                                          : GridView.builder(
                                              padding: const EdgeInsets.all(12),
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                childAspectRatio: 0.8,
                                                crossAxisSpacing: 8,
                                                mainAxisSpacing: 8,
                                              ),
                                              itemCount: state.products.length,
                                              itemBuilder: (context, index) {
                                                final product = state.products[index];
                                                final favoritesCubit = context.watch<FavoritesCubit>();
                                                bool isFav = favoritesCubit.isFavorite(product.id);
                                                return ProductSuccessBuild(
                                                  product: product,
                                                  isFav: isFav,
                                                );
                                              },
                                            ),
                            ),
                          ],
                        );
                      }
                    }

                    return const NotContainData();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
