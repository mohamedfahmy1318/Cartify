import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/custom_messages.dart';
import 'package:full_ecommerce_app/src/core/widgets/text_fields/default_text_field.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/cubit/update_password_cubit.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({super.key});

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText('Update Password'),
        backgroundColor: AppColors.primary,
        elevation: 0,
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileTabCubit, ProfileTabState>(
        listener: (context, state) {
          if (state.status == UpdatePasswordStatus.success) {
            MessageUtils.showSimpleToast(context, msg: 'Password updated successfully');
          
            Navigator.pop(context);
          } else if (state.status == UpdatePasswordStatus.failure) {
            MessageUtils.showSimpleToast(context, msg: 'Failed to update password');
          }
        },
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(15.sp),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch  ,
                children: [
                  // Current Password Field
                  DefaultTextField(
                    controller: _currentPasswordController,
                    title: 'Current Password',
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your current password';
                      }
                      return null;
                    },
                  ),
                  20.szH,

                  // New Password Field
                  DefaultTextField(
                    controller: _newPasswordController,
                    isPassword: !state.isNewPasswordVisible,
                    title: 'New Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter new password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  20.szH,

                  // Confirm Password Field
                  DefaultTextField(
                    controller: _confirmPasswordController,
                    isPassword: !state.isConfirmPasswordVisible,
                    title: 'Confirm Password',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your new password';
                      }
                      if (value != _newPasswordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  40.szH,

                  // Update Button
                  ElevatedButton(
                    onPressed: state.status == UpdatePasswordStatus.loading
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<ProfileTabCubit>().updatePassword(
                                currentPassword:
                                    _currentPasswordController.text,
                                newPassword: _newPasswordController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
                              );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: EdgeInsets.symmetric(vertical: 15.sp),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.sp),
                      ),
                    ),
                    child: state.status == UpdatePasswordStatus.loading
                        ? SizedBox(
                            height: 20.sp,
                            width: 20.sp,
                            child: const CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : AppText(
                            'Update Password',
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
