import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/category_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category_grid_view.dart';

class ViewAllCategory extends StatefulWidget {
  const ViewAllCategory({super.key});

  @override
  State<ViewAllCategory> createState() => _ViewAllCategoryState();
}

class _ViewAllCategoryState extends State<ViewAllCategory> {
  @override
  void initState() {
    context.read<CategoryCubit>().fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.scaffoldBackground,
        title: Text(
          'All Categories',
          style: TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeightManager.bold,
            fontSize: AppSize.sH16,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Go.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.primary,
            size: 25.w,
          ),
        ),
      ),
      body: CategoryGridView(),
    );
  }
}
