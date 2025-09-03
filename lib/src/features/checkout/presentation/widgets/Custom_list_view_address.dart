import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_state.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/widgets/custom_card_address.dart';

class CustomListViewAddress extends StatefulWidget {
  final Function(AddressEntity)? onAddressSelected;
  
  const CustomListViewAddress({
    super.key,
    this.onAddressSelected,
  });

  @override
  State<CustomListViewAddress> createState() => _CustomListViewAddressState();
}

class _CustomListViewAddressState extends State<CustomListViewAddress> {
  int _selectedAddressIndex = 0; // Default to first address

  void _onAddressSelectedWithEntity(int index, AddressEntity address) {
    setState(() {
      _selectedAddressIndex = index;
    });
    
    // Notify parent widget
    if (widget.onAddressSelected != null) {
      widget.onAddressSelected!(address);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.h,
      child: BlocConsumer<AddressCubit, AddressState>(
   
        listener: (context, state) {
  
          if (state.deleteAddressStatus == BaseStatus.success) {
            final addressCount = state.addressResponseEntity?.data?.length ?? 0;
            if (_selectedAddressIndex >= addressCount && addressCount > 0) {
              setState(() {
                _selectedAddressIndex = 0;
              });
            }
            context.read<AddressCubit>().resetDeleteAddressState();
          }

          if (state.deleteAddressStatus == BaseStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.deleteAddressErrorMessage.isNotEmpty
                      ? state.deleteAddressErrorMessage
                      : 'Failed to delete address',
                ),
                backgroundColor: Colors.red,
              ),
            );
            context.read<AddressCubit>().resetDeleteAddressState();
          }
        },
        buildWhen: (previous, current) =>
            previous.addressStatus != current.addressStatus ||
            previous.addressResponseEntity != current.addressResponseEntity,
        builder: (context, state) {
          switch (state.addressStatus) {
            case BaseStatus.loading:
              return CustomLoading.showLoadingView();
            case BaseStatus.initial:
              return const SizedBox();
            case BaseStatus.error:
              return const NotContainData();
            case BaseStatus.success:
              if (state.addressResponseEntity!.data!.isEmpty) {
                return const NotContainData();
              }
              var addresses = state.addressResponseEntity!.data!.reversed.toList();
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: addresses.length,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => 8.szW,

                itemBuilder: (context, index) => CustomCardAddress(
                  addressIndex: index,
                  isSelected: _selectedAddressIndex == index,
                  onAddressSelected: (selectedIndex) {
                    _onAddressSelectedWithEntity(selectedIndex, addresses[selectedIndex]);
                  },
                  addressEntity: addresses[index],
                ),
              );
          }
        },
      ),
    );
  }
}
