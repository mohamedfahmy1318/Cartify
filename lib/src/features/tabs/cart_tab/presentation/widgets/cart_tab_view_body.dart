import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/widgets/cart_list_view.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/widgets/fotter_widget_cart.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/tab_hom__header_app.dart';

class CartTabViewBody extends StatefulWidget {
  const CartTabViewBody({super.key});

  @override
  State<CartTabViewBody> createState() => _CartTabViewBodyState();
}

class _CartTabViewBodyState extends State<CartTabViewBody> {
    @override
  void initState() {
    context.read<CartCubit>().fetchAllCart();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        switch(state.cartStatus) {
          case BaseStatus.loading:
            // Only show loading if not just updating quantity
            if (state.isUpdating) {
              return successWidget(context);
            } else {
              return CustomLoading.showLoadingView();
            }
          case BaseStatus.initial:
            return const Text('Start adding products to your cart');
          case BaseStatus.success:
            return successWidget(context);
          case BaseStatus.error:
            return const NotContainData();
        }
      },
    );
  }

  Widget successWidget(BuildContext context) {
    return Column(
      children: [
        const TabHomeHeader(titleSearch: 'Search in cart'),
        SizedBox(height: 14.h),
        const Expanded(child: CartListView()),
        SizedBox(height: 14.h),
        FooterWidgetCart(
          cartEntity: context
              .read<CartCubit>()
              .state
              .cartResponseEntity!
              .data!,
        ),
      ],
    );
  }
}