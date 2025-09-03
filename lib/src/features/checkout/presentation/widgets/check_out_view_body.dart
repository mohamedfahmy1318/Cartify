import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/checkout_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/checkout_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/screens/order_success_screen.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/Custom_list_view_address.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/app_text_checkout.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/payment_meathod.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/cubit/cart_cubit.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  String _selectedPaymentMethod = 'cash';
  AddressEntity? _selectedAddress;

  @override
  void initState() {
    context.read<AddressCubit>().fetchAllAddress();
    super.initState();
  }

  void _onPaymentMethodChanged(String method) {
    setState(() {
      _selectedPaymentMethod = method;
    });
  }

  void _onAddressSelected(AddressEntity address) {
    setState(() {
      _selectedAddress = address;
    });
  }

  void _proceedToCheckout() {
    if (_selectedAddress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a delivery address')),
      );
      return;
    }

    if (_selectedPaymentMethod == 'cash') {
      // Create cash order
      context.read<CheckoutCubit>().createCashOrder(
        cartId: context.read<CartCubit>().state.cartResponseEntity?.cartId ?? '',
        addressDetails: _selectedAddress!.details ?? '',
        phone: _selectedAddress!.phone ?? '',
        city: _selectedAddress!.city ?? '',
      );
    } else {
      // Handle card payment (implement later)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Card payment coming soon!')),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<CheckoutCubit, CheckoutState>(
      listener: (context, checkoutState) {
        if (checkoutState.checkoutStatus == BaseStatus.success) {
          // Navigate to success page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => OrderSuccessScreen(
                orderDetails: checkoutState.checkoutEntity,
              ),
            ),
          );
          
          // Alternative navigation if you have named routes:
          // Navigator.pushReplacementNamed(
          //   context, 
          //   OrderSuccessScreen.routeName,
          //   arguments: checkoutState.checkoutEntity,
          // );
        } else if (checkoutState.checkoutStatus == BaseStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(checkoutState.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AppTextCheckout(text: 'Delivery Address'),
            15.szH,
            SizedBox(
              height: 140.h,
              child: CustomListViewAddress(
                onAddressSelected: _onAddressSelected,
              ),
            ),
            35.szH,
            OrderPaymentMethod(
              onPaymentMethodChanged: _onPaymentMethodChanged,
            ),
            30.szH,
            BlocBuilder<CheckoutCubit, CheckoutState>(
              builder: (context, checkoutState) {
                return DefaultButton(
                  onTap: checkoutState.checkoutStatus == BaseStatus.loading 
                      ? null 
                      : _proceedToCheckout,
                  height: 50.h,
                  elevation: 3,
                  title: checkoutState.checkoutStatus == BaseStatus.loading 
                      ? 'Processing...' 
                      : 'Proceed to Checkout',
                );
              },
            ),
            4.szH,
          ],
        ),
      ),
    );
  }
}
