import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/default_bottom_sheet.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/checkout_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/add_address_btn_sheet.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/app_bar_check_out.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/check_out_view_body.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<AddressCubit>()),
        BlocProvider(create: (context) => sl<CheckoutCubit>()),
      ],
      child: const CheckoutView(),
    );
  }
}

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCheckout(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.pW10),
        child: const CheckoutViewBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDefaultBottomSheet(
            context: context,
            child: BlocProvider.value(
              value: context.read<AddressCubit>(),
              // ignore: prefer_const_constructors
              child: AddAddressBottomSheet(),
            ),
          );
        },
        tooltip: 'Add New Address',
        child: const Icon(Icons.add_location_alt_outlined),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
