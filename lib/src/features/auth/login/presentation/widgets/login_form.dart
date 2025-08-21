import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/language/locale_keys.g.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/helpers/validators.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/loading_button.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_widget_validator.dart';
import 'package:full_ecommerce_app/src/core/widgets/text_fields/default_text_field.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/widgets/forgot_password_btn.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          30.szH,
          CustomWidgetValidator<String>(
            validator: (value) => Validators.validateEmail(value),
            builder: (field) {
              return DefaultErrorBody(
                value: field,
                child: DefaultTextField(
                  controller: _emailController,
                  label: LocaleKeys.email.tr(),
                  onChanged:
                      field.didChange, // مهم عشان الـ validator يشتغل مع التغير
                ),
              );
            },
          ),

          30.szH,
          CustomWidgetValidator<String>(
            validator: (value) => Validators.validatePassword(value),
            builder: (field) {
              return DefaultErrorBody(
                value: field,
                child: DefaultTextField(
                  isPassword: true,
                  secure: true,
                  controller: _passwordController,
                  label: LocaleKeys.password.tr(),
                  onChanged: field.didChange,
                ),
              );
            },
          ),

          15.szH,
          const ForgotPasswordButton(),
          10.szH,
          LoadingButton(
            onTap: () async {
              if (_formKey.currentState?.validate() ?? false) {}
            },
            title: LocaleKeys.signIn.tr(),
          ),
          15.szH,
          Row(
            children: [
              Text('${LocaleKeys.doNotHaveAnAccount.tr()}? '),
              GestureDetector(
                child: AppText(
                  LocaleKeys.createAccount.tr(),
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
