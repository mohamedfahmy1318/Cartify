import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/language/locale_keys.g.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/helpers/validators.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/loading_button.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/core/widgets/text_fields/default_text_field.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/cubit/forgot_password_cubit.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/cubit/forgot_password_state.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/screens/pin_code_screen.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/widgets/custom_header_forgot_password.dart';

class ForgotBody extends StatefulWidget {
  const ForgotBody({super.key});

  @override
  State<ForgotBody> createState() => _ForgotBodyState();
}

class _ForgotBodyState extends State<ForgotBody> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    final cubit = context.read<ForgotPasswordCubit>();
    final isLoading = cubit.state.baseStatus.isLoading;

    if (!isLoading && (_formKey.currentState?.validate() ?? false)) {
      // Hide keyboard
      FocusScope.of(context).unfocus();

      await cubit.forgotPassword(
        ForgotPasswordRequest(email: _emailController.text.trim()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.pW16),
      child: BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
        listener: (context, state) {
          state.baseStatus.when(
            onSuccess: () {
              MessageUtils.showSimpleToast(
                context,
                msg: 'Password reset code sent to email',
              );
              Go.to(const PinCodeScreen());
            },
            onError: () {
              MessageUtils.showSimpleToast(
                context,
                msg: state.errorMessage.isNotEmpty
                    ? state.errorMessage
                    : 'Something went wrong. Please try again.',
              );
            },
            onLoading: () {
              // Optional: Show additional loading feedback if needed
            },
          );
        },
        builder: (context, state) {
          final isLoading = state.baseStatus.isLoading;

          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomHeaderForgotPassword(
                  title: LocaleKeys.forgotPassword.tr(),
                  description: 'Please enter your email to reset the password',
                ),
                DefaultTextField(
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  title: 'Email',
                  validator: (value) => Validators.validateEmail(value),
                ),
                // Email Input Field
                if (isLoading)
                  Center(child: CustomLoading.showLoadingView())
                else
                  LoadingButton(title: 'Reset Password', onTap: _submitForm),
              ],
            ),
          );
        },
      ),
    );
  }
}

//
//
