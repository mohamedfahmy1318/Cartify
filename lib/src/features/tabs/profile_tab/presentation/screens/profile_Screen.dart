import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person_rounded, size: 64, color: AppColors.primary),
          SizedBox(height: 16),
          Text(
            'Profile Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Manage your account',
            style: TextStyle(fontSize: 16, color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}
