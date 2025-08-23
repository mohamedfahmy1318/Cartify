import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/loading_button.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_loading.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/core/widgets/text_fields/pin_text_field.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/pin_code_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/cubit/reset_code/reset_code_cubit.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/cubit/reset_code/reset_code_state.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/widgets/custom_header_forgot_password.dart';

class PinCodeViewBody extends StatefulWidget {
  const PinCodeViewBody({super.key});

  @override
  State<PinCodeViewBody> createState() => _PinCodeViewBodyState();
}

class _PinCodeViewBodyState extends State<PinCodeViewBody> {
  final _pinController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  Future<void> _submitCode() async {
    final cubit = context.read<ResetCodeCubit>();
    final isLoading = cubit.state.baseStatus.isLoading;

    if (!isLoading && (_formKey.currentState?.validate() ?? false)) {
      // Hide keyboard
      FocusScope.of(context).unfocus();
      await cubit.resetCode(
        ResetCodeRequest(resetCode: _pinController.text.trim()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetCodeCubit, ResetCodeState>(
      listener: (context, state) {
        state.baseStatus.when(
          onSuccess: () {
            MessageUtils.showSimpleToast(context, msg: 'Success Code');
            //Go.to(const HomingScreen());
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

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppPadding.pW16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderForgotPassword(
                  title: 'Check your email',
                  description:
                      'We sent code in the email enter 5 digit code that mentioned ',
                ),
                //custom_pinField
                CustomPinTextField(
                  controller: _pinController,

                  onCompleted: (value) {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Handle the completed PIN input
                      // For example, you can navigate to the next screen or verify the PIN
                    }
                  },
                ),

                20.szH,
                if (isLoading)
                  Center(child: CustomLoading.showLoadingView())
                else
                  LoadingButton(title: 'Reset Password', onTap: _submitCode),
              ],
            ),
          ),
        );
      },
    );
  }
}
