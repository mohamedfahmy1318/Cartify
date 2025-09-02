import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/Custom_list_view_address.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/app_text_checkout.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/order_summary_widget.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/payment_meathod.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  @override
  void initState() {
    context.read<AddressCubit>().fetchAllAddress();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          8.szH,
          const AppTextCheckout(text: 'Delivery Address'),
          4.szH,
          SizedBox(
            height: 140.h, // أو أي ارتفاع مناسب
            child: const CustomListViewAddress(),
          ),
          8.szH,
          const OrderSummaryWidget(),
          8.szH,
          const OrderPaymentMethod(),
          8.szH,
          DefaultButton(
            onTap: () {
              // Handle checkout button press
            },
            height: 50.h,
            elevation: 3,
            title: 'Proceed to Checkout',
          ),
          4.szH,
        ],
      ),
    );
  }
}
