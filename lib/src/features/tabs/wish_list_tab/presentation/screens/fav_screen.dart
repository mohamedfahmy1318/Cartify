import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/domain/use_cases/get_fav_products_use_case.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/widgets/favorites_tab_view_body.dart';

class FavoritesTabScreen extends StatelessWidget {
  const FavoritesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FavoritesCubit(sl<GetFavProductsUseCase>())..getFavProducts(),
      child: const _FavoritesTabView(),
    );
  }
}

class _FavoritesTabView extends StatelessWidget {
  const _FavoritesTabView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FavoritesTabViewBody());
  }
}
