import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/data/models/pin_code_request.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/use_case/rese_code_use_case.dart';
import 'package:full_ecommerce_app/src/features/auth/forgot_password/presentation/cubit/reset_code/reset_code_state.dart';

class ResetCodeCubit extends Cubit<ResetCodeState> {
  final ResetCodeUseCase _resetCodeUseCase;

  ResetCodeCubit(this._resetCodeUseCase) : super(ResetCodeState.initial());

  Future<void> resetCode(ResetCodeRequest code) async {
    if (state.baseStatus.isLoading) return;

    if (code.resetCode.trim().isEmpty) {
      emit(
        state.copyWith(
          baseStatus: BaseStatus.error,
          errorMessage: 'Code is required',
        ),
      );
      return;
    }

    emit(state.copyWith(baseStatus: BaseStatus.loading, errorMessage: ''));

    try {
      final result = await _resetCodeUseCase.call(code);

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
    emit(ResetCodeState.initial());
  }
}
