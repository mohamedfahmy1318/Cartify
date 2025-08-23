import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';

class CategoriesTabScreen extends StatelessWidget {
  const CategoriesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.grid_view_rounded, size: 64, color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            'Categories Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Browse product categories',
            style: TextStyle(fontSize: 16, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
