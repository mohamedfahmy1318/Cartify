import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/data/models/password_request_model.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/domain/use_cases/update_password_use_case.dart';

part 'update_password_state.dart';

class ProfileTabCubit extends Cubit<ProfileTabState> {
  final UpdatePasswordUseCase updatePasswordUseCase;
  final UserCubit userCubit;

  ProfileTabCubit(
     this.updatePasswordUseCase,
     this.userCubit,
  ) : super(const ProfileTabState());

  /// Update user password
  Future<void> updatePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    emit(state.copyWith(status: UpdatePasswordStatus.loading));

    final request = PasswordRequestModel(
      currentPassword: currentPassword,
      newPassword: newPassword,
      reNewPassword: confirmPassword,
    );

    final result = await updatePasswordUseCase(request);
    
    result.when(
      (response) {
        if (response.isSuccess && response.user != null && response.token != null) {
          // Update user data in UserCubit
          userCubit.setUserLoggedIn(
            user: response.user!,
            token: response.token!,
          );
          
          emit(state.copyWith(
            status: UpdatePasswordStatus.success,
            successMessage: 'Password updated successfully',
            errorMessage: null,
          ));
        } else {
          // Handle API failure response
          final errorMsg = response.errors?.userFriendlyMessage ?? 'Failed to update password';
          emit(state.copyWith(
            status: UpdatePasswordStatus.failure,
            errorMessage: errorMsg,
            successMessage: null,
          ));
        }
      },
      (failure) {
        emit(state.copyWith(
          status: UpdatePasswordStatus.failure,
          errorMessage: failure.message,
          successMessage: null,
        ));
      },
    );
  }

  /// Toggle current password visibility
  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  /// Toggle new password visibility
  void toggleNewPasswordVisibility() {
    emit(state.copyWith(isNewPasswordVisible: !state.isNewPasswordVisible));
  }

  /// Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    emit(state.copyWith(isConfirmPasswordVisible: !state.isConfirmPasswordVisible));
  }

  /// Clear messages and reset state
  void clearMessages() {
    emit(state.clearMessages());
  }

  /// Reset to initial state
  void reset() {
    emit(const ProfileTabState());
  }
}
