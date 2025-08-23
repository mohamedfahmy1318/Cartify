import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/forgot_password_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/use_case/forgot_password_use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordCubit(this._forgotPasswordUseCase)
    : super(ForgotPasswordState.initial());

  Future<void> forgotPassword(ForgotPasswordRequest email) async {
    // Don't proceed if already loading
    if (state.baseStatus.isLoading) return;

    // Validate email before making the request
    if (email.email.trim().isEmpty) {
      emit(
        state.copyWith(
          baseStatus: BaseStatus.error,
          errorMessage: 'Email is required',
        ),
      );
      return;
    }

    emit(state.copyWith(baseStatus: BaseStatus.loading, errorMessage: ''));

    try {
      final result = await _forgotPasswordUseCase.call(email);

      result.when(
        (data) async {
          emit(state.copyWith(baseStatus: BaseStatus.success));
        },
        (error) {
          emit(
            state.copyWith(
              baseStatus: BaseStatus.error,
              errorMessage: error.message.isNotEmpty
                  ? error.message
                  : 'Failed to send reset email',
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          baseStatus: BaseStatus.error,
          errorMessage: 'An unexpected error occurred. Please try again.',
        ),
      );
    }
  }

  void resetState() {
    emit(ForgotPasswordState.initial());
  }
}
