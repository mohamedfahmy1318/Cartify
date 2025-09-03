part of 'update_password_cubit.dart';

enum UpdatePasswordStatus { initial, loading, success, failure }

class ProfileTabState extends Equatable {
  final UpdatePasswordStatus status;
  final String? successMessage;
  final String? errorMessage;
  final bool isPasswordVisible;
  final bool isNewPasswordVisible;
  final bool isConfirmPasswordVisible;

  const ProfileTabState({
    this.status = UpdatePasswordStatus.initial,
    this.successMessage,
    this.errorMessage,
    this.isPasswordVisible = false,
    this.isNewPasswordVisible = false,
    this.isConfirmPasswordVisible = false,
  });

  ProfileTabState copyWith({
    UpdatePasswordStatus? status,
    String? successMessage,
    String? errorMessage,
    bool? isPasswordVisible,
    bool? isNewPasswordVisible,
    bool? isConfirmPasswordVisible,
  }) {
    return ProfileTabState(
      status: status ?? this.status,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isNewPasswordVisible: isNewPasswordVisible ?? this.isNewPasswordVisible,
      isConfirmPasswordVisible: isConfirmPasswordVisible ?? this.isConfirmPasswordVisible,
    );
  }

  // Clear messages while keeping visibility states
  ProfileTabState clearMessages() {
    return copyWith(
      status: UpdatePasswordStatus.initial,
      successMessage: null,
      errorMessage: null,
    );
  }

  @override
  List<Object?> get props => [
        status,
        successMessage,
        errorMessage,
        isPasswordVisible,
        isNewPasswordVisible,
        isConfirmPasswordVisible,
      ];
}
