import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/text_fields/default_text_field.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/home_tab_cubit.dart';

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
    context.read<HomeTabCubit>().onSearchChanged(value??"");
  },
  onSubmitted: (value) {
    // لو عايز تعمل server-side search عند submit:
    //context.read<HomeTabCubit>().searchServerSide(value);
  },
        style: TextStyle(fontSize: FontSize.s14, color: AppColors.primary),
      ),
    );
  }
}
