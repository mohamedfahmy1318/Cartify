import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/language/locale_keys.g.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/helpers/validators.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/loading_button.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_widget_validator.dart';
import 'package:full_ecommerce_app/src/core/widgets/text_fields/default_text_field.dart';
import 'package:full_ecommerce_app/src/features/auth/login/data/models/login_request_model.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/widgets/dont_have_account.dart';
import 'package:full_ecommerce_app/src/features/auth/login/presentation/widgets/forgot_password_btn.dart';
import 'package:full_ecommerce_app/src/homming.dart';

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
  void initState() {
    super.initState();
    // Clear any previous state when widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginCubit>().resetState();
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState?.validate() ?? false) {
      final cubit = context.read<LoginCubit>();
      cubit.login(
        LoginRequestModel(_emailController.text, _passwordController.text),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.baseStatus.isSuccess) {
          MessageUtils.showSimpleToast(msg: 'Login successful!', context);
          Go.offAll(const HomingScreen());
        }
      },
      builder: (context, state) {
        final isLoading = state.baseStatus.isLoading;

        return Form(
          key: _formKey,
          child: Column(
            children: [
              30.szH,
              // Email Field
              CustomWidgetValidator<String>(
                validator: (value) => Validators.validateEmail(value),
                builder: (field) {
                  return DefaultErrorBody(
                    value: field,
                    child: DefaultTextField(
                      controller: _emailController,
                      label: LocaleKeys.email.tr(),
                      readOnly: isLoading,
                      onChanged: (value) {
                        field.didChange(value);
                        // Clear error when user starts typing
                        if (state.baseStatus.isError) {
                          context.read<LoginCubit>().clearError();
                        }
                      },
                    ),
                  );
                },
              ),

              30.szH,

              // Password Field
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
                      readOnly: isLoading,
                      onChanged: (value) {
                        field.didChange(value);
                        // Clear error when user starts typing
                        if (state.baseStatus.isError) {
                          context.read<LoginCubit>().clearError();
                        }
                      },
                    ),
                  );
                },
              ),

              15.szH,
              const ForgotPasswordButton(),

              // Error Message Display
              if (state.baseStatus.isError &&
                  state.errorMessage.isNotEmpty) ...[
                10.szH,
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red.withOpacity(0.3)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.error_outline,
                        color: Colors.red,
                        size: 20,
                      ),
                      8.szW,
                      Expanded(
                        child: AppText(
                          state.errorMessage,
                          color: Colors.red,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              10.szH,
              // Login Button with Loading State
              if (isLoading)
                Center(child: CustomLoading.showLoadingView())
              else
                LoadingButton(
                  onTap: _handleLogin,
                  title: LocaleKeys.signIn.tr(),
                ),

              15.szH,
              const DontHaveAccount(),
            ],
          ),
        );
      },
    );
  }
}
