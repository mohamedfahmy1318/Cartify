import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/widgets/login_form.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/widgets/login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.pW14),
        child: const Column(children: [LoginHeader(), LoginForm()]),
      ),
    );
  }
}
