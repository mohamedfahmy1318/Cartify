import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/not_contain_data.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/category_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/cubit/category_state.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        switch (state.baseStatus) {
          case BaseStatus.loading:
            return CustomLoading.showLoadingView();
          case BaseStatus.success:
            return _buildSuccessGrid(state);
          case BaseStatus.error:
            return const NotContainData();
          case BaseStatus.initial:
            return _buildInitialWidget();
        }
      },
    );
  }

  Widget _buildSuccessGrid(CategoryState state) {
    if (state.categories.isEmpty) {
      return const NotContainData();
    }
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.3,
          mainAxisSpacing: 2,
          crossAxisSpacing: 15,
        ),
        itemCount: state.categories.length,
        itemBuilder: (context, index) {
          final category = state.categories[index];
          return CategoryItem(category: category);
        },
      ),
    );
  }

  Widget _buildInitialWidget() {
    return const Expanded(
      child: Center(
        child: Text(
          'Tap to load categories',
          style: TextStyle(fontSize: 16, color: AppColors.grey),
        ),
      ),
    );
  }
}
