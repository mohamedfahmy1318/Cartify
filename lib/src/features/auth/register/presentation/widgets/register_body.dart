import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/features/auth/register/presentation/widgets/register_form.dart';
import 'package:full_ecommerce_app/src/features/auth/register/presentation/widgets/register_header.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.pW14),
        child: const Column(children: [RegisterHeader(), RegisterForm()]),
      ),
    );
  }
}
