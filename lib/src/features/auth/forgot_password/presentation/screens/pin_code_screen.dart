import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/use_case/rese_code_use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/cubit/reset_code/reset_code_cubit.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/widgets/pin_code_body.dart';

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetCodeCubit(sl<ResetCodeUseCase>()),
      child: const _PinCodeView(),
    );
  }
}

class _PinCodeView extends StatelessWidget {
  const _PinCodeView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: PinCodeViewBody()));
  }
}
