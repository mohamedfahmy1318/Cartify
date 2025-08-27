import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_rounded, size: 64, color: AppColors.primary),
          const SizedBox(height: 16),
          const Text(
            'Profile Screen',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Manage your account',
            style: TextStyle(fontSize: 16, color: AppColors.grey),
          ),
          DefaultButton(
            title: 'Log out',
            onTap: () {
              // Handle log out
              context.read<UserCubit>().logout();
              print('User logged out');
              print(sl<UserCubit>().user.email);

              Go.offAllNamed(NamedRoutes.login);
            },
          ),
        ],
      ),
    );
  }
}
