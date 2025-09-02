import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/custom_card_address.dart';

class CustomListViewAddress extends StatefulWidget {
  const CustomListViewAddress({super.key});

  @override
  State<CustomListViewAddress> createState() => _CustomListViewAddressState();
}

class _CustomListViewAddressState extends State<CustomListViewAddress> {
  int _selectedAddressIndex = 0; // Default to first address

  void _onAddressSelected(int index) {
    setState(() {
      _selectedAddressIndex = index;
    });
    // You can add logic here to save the selected address
    // or notify parent widgets about the selection change
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h, // Fixed height for horizontal list
      child: BlocBuilder<AddressCubit, AddressState>(
        
        builder: (context, state) {
          switch(state.addressStatus) {
            case BaseStatus.loading:
              return  CustomLoading.showLoadingView();
            case BaseStatus.initial:
              return const SizedBox();
            case BaseStatus.error:
              return const NotContainData();
            case BaseStatus.success:
              if (state.addressResponseEntity!.data!.isEmpty) {
                return const NotContainData();
              }
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: state.addressResponseEntity!.data!.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) => 8.szW,
            
            itemBuilder: (context, index) => CustomCardAddress(
              addressIndex: index,
              isSelected: _selectedAddressIndex == index,
              onAddressSelected: _onAddressSelected,
              addressEntity: state.addressResponseEntity!.data![index],
            ),
          );
        }
        }
      )
    );
  }
}
