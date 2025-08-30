import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_banners_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_category_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/use_cases/get_products_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/home_tab_view_body.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeTabCubit(
              sl<GetCategoryUseCase>(),
              sl<GetBannersUseCase>(),
              sl<GetProductsUseCase>(),
            )
            ..fetchCategories(limit: 6)
            ..fetchBanners(limit: 8)
            ..fetchProducts(limit: 5),
      child: const _HomeTabView(),
    );
  }
}

class _HomeTabView extends StatelessWidget {
  const _HomeTabView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeTabViewBody());
  }
}
