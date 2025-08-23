import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/use_case/forgot_password_use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/widgets/forgot_password_body.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(sl<ForgotPasswordUseCase>()),
      child: const _ForgotView(),
    );
  }
}

class _ForgotView extends StatelessWidget {
  const _ForgotView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(child: ForgotBody()),
    );
  }
}
