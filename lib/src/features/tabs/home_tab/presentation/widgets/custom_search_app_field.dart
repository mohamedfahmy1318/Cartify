import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/text_fields/default_text_field.dart';

class CustomSearchAppField extends StatelessWidget {
  const CustomSearchAppField({super.key, required this.titleSearch});
  final String titleSearch;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTextField(
        title: titleSearch,
        prefixIcon: Icon(
          Icons.search,
          color: AppColors.primary,
          size: AppSize.sW25,
        ),
        action: TextInputAction.search,
        inputType: TextInputType.text,
        filled: true,
        fillColor: AppColors.white,
        onChanged: (value) {
          // Handle search input changes
        },
        style: TextStyle(fontSize: FontSize.s14, color: AppColors.primary),
      ),
    );
  }
}
