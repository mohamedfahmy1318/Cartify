import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/widgets/cart_item.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_state.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final products = state.cartResponseEntity?.data?.products ?? const [];
        if (products.isEmpty) {
          return const SizedBox.shrink();
        }
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: products.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final cartItem = products[index];
            return CartItem(cartItem: cartItem);
          },
        );
      },
    );
  }
}