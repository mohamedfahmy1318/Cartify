import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/cubit/update_password_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/screens/update_password_screen.dart';

class ResetAndEditButtons extends StatelessWidget {
  const ResetAndEditButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultButton(
            height: 45.h,
            width: 200.w,
            onTap: () {
              Go.to(
                BlocProvider(
                  create: (context) => sl<ProfileTabCubit>(),
                  child: const UpdatePasswordScreen(),
                ),
              );
            },
            title: 'Reset Password',

            textColor: AppColors.white,
            color: AppColors.hintText,
          ),
        ),
        15.szW,
        Expanded(
          child: DefaultButton(
            height: 45.h,
            width: 200.w,
            onTap: () {},
            title: 'Edit Profile',
          ),
        ),
      ],
    );
  }
}
