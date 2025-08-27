import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_sliver_header_delegat.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/tab_hom__header_app.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/cubit/fav_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/widgets/custom_List_favorite_products.dart';

class FavoritesTabViewBody extends StatefulWidget {
  const FavoritesTabViewBody({super.key});

  @override
  State<FavoritesTabViewBody> createState() => _FavoritesTabViewBodyState();
}

class _FavoritesTabViewBodyState extends State<FavoritesTabViewBody> {
  @override
  void initState() {
    super.initState();
    // Delay the call to ensure UserCubit has finished initialization
    context.read<FavoritesCubit>().getFavProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return state.favoritesStatus.when(
          onSuccess: () => buildSuccessState(state),
          onLoading: () => CustomLoading.showLoadingView(),
          onError: () {
            return const NotContainData();
          },
        );
      },
    );
  }

  Widget buildSuccessState(FavoritesState state) {
    var favEntity = state.favEntity;

    // Handle empty favorites state
    if (favEntity.isEmpty) {
      return CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
              minHeight: 120.0.h,
              maxHeight: 120.0.h,
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: const TabHomHeader(
                  titleSearch: ' Favorites products...',
                ),
              ),
            ),
          ),
          const SliverFillRemaining(child: NotContainData()),
        ],
      );
    }
    return CustomScrollView(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: SliverHeaderDelegate(
            minHeight: 120.0.h,
            maxHeight: 120.0.h,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: const TabHomHeader(titleSearch: ' Favorites products...'),
            ),
          ),
        ),
        // Add your favorite products list or grid here
        CustomListFavoritesProducts(favorites: favEntity),
      ],
    );
  }
}
