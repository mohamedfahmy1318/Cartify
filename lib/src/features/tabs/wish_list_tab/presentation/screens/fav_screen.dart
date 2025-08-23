import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';

class FavoritesTabScreen extends StatelessWidget {
  const FavoritesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_rounded, size: 64, color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            'Favorites Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Your favorite products',
            style: TextStyle(fontSize: 16, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
