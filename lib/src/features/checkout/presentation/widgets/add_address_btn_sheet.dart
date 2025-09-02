import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/core/widgets/text_fields/default_text_field.dart';
import 'package:full_ecommerce_app/src/features/checkout/data/models/address_request.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_cubit.dart';
import 'package:full_ecommerce_app/src/features/checkout/presentation/cubits/address_state.dart';

class AddAddressBottomSheet extends StatefulWidget {
  const AddAddressBottomSheet({super.key});

  @override
  State<AddAddressBottomSheet> createState() => _AddAddressBottomSheetState();
}

class _AddAddressBottomSheetState extends State<AddAddressBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(
    text: 'John Doe'
  );
  final _phoneController = TextEditingController(
    text: '1234567890'
  );
  final _addressController = TextEditingController(
    text: '123 Main St'
  );
  final _cityController = TextEditingController(
    text: 'New York'
  );

  bool _isAddingAddress = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddressCubit, AddressState>(
      listener: (context, state) {
        if (state.addressStatus == BaseStatus.loading && !_isAddingAddress) {
          // Started fetching addresses normally
          setState(() => _isAddingAddress = false);
        } else if (state.addressStatus == BaseStatus.success && _isAddingAddress) {
          // Address was successfully added and list was refreshed
          setState(() => _isAddingAddress = false);

          // Show success message
          MessageUtils.showSnackBar(
            'Address added successfully!',
            backgroundColor: Colors.deepOrange,
            textColor: Colors.white,
          );
          // Close the bottom sheet
          Navigator.of(context).pop();
        } else if (state.addressStatus == BaseStatus.error && _isAddingAddress) {
          // Error occurred while adding address
          setState(() => _isAddingAddress = false);

          // Show error message
          MessageUtils.showSnackBar(
            state.addressErrorMessage,
            backgroundColor: Colors.red,
            textColor: Colors.white,
          );
        }
      },
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.r),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Icon(
                      Icons.location_on_rounded,
                      color: AppColors.primary,
                      size: 20.r,
                    ),
                  ),
                  12.szW,
                  AppText(
                    'Add New Address',
                    fontSize: FontSize.s18,
                    fontWeight: FontWeightManager.bold,
                    color: AppColors.black,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.close, color: AppColors.grey, size: 20.r),
                  ),
                ],
              ),
              20.szH,

              // Name Field
              DefaultTextField(
                controller: _nameController,
                label: 'Full Name',
                suffixIcon: const Icon(Icons.person_outline),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              16.szH,

              // Phone Field
              DefaultTextField(
                controller: _phoneController,
                label: 'Phone Number',
                suffixIcon: const Icon(Icons.phone_outlined),
                inputType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length < 10) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              16.szH,
              // City Field
              DefaultTextField(
                controller: _cityController,
                label: 'City',
                title: 'Enter your city',
                suffixIcon: const Icon(Icons.location_city_outlined),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
              16.szH,
              // Address Field
              DefaultTextField(
                controller: _addressController,
                label: 'Details',
                suffixIcon: const Icon(Icons.info_outlined),
                maxLines: 2,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Details';
                  }
                  return null;
                },
              ),
              24.szH,

              // Action Buttons
              BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  final isLoading = state.addressStatus == BaseStatus.loading;

                  return Row(
                    children: [
                      Expanded(
                        child: DefaultButton(
                          onTap: () => Navigator.of(context).pop(),
                          height: 45.h,
                          title: 'Cancel',
                          fontSize: FontSize.s14,
                          fontWeight: FontWeightManager.medium,
                          color: AppColors.grey,
                        ),
                      ),
                      12.szW,
                      Expanded(
                        child: DefaultButton(
                          onTap: isLoading ? null : _submitForm,
                          height: 45.h,
                          title: isLoading ? 'Adding...' : 'Add Address',
                          fontSize: FontSize.s14,
                          fontWeight: FontWeightManager.medium,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  );
                },
              ),
              20.szH, // Bottom padding for safe area
            ],
          ),
        ),
      ),
    );
  }

void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isAddingAddress = true);
      context.read<AddressCubit>().addAddress(AddressRequest(
        name: _nameController.text,
        phone: _phoneController.text,
        details: _addressController.text,
        city: _cityController.text,
      ));
      // The cubit will handle the rest - showing messages and closing the sheet
    }
  }}
