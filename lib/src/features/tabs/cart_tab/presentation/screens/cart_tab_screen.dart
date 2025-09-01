import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/widgets/cart_tab_view_body.dart';

class CartTabScreen extends StatefulWidget {
  const CartTabScreen({super.key});

  @override
  State<CartTabScreen> createState() => _CartTabScreenState();
}

class _CartTabScreenState extends State<CartTabScreen> {

  @override
  Widget build(BuildContext context) {
    return const _CartTabView();
  }
}

class _CartTabView extends StatelessWidget {
  const _CartTabView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pH14),
          child: const CartTabViewBody(),
        ),
      ),
    );
  }
}
