import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';
import 'package:full_ecommerce_app/src/features/auth/register/data/models/register_request_model.dart';
import 'package:full_ecommerce_app/src/features/auth/register/domain/use_cases/register_use_case.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterCubit(this._registerUseCase) : super(RegisterState.initial());

  /// Reset the register state to initial
  void resetState() {
    emit(RegisterState.initial());
  }

  /// Clear error message
  void clearError() {
    emit(state.copyWith(baseStatus: BaseStatus.initial, errorMessage: ''));
  }

  Future<void> register(RegisterRequestModel registerRequest) async {
    emit(state.copyWith(baseStatus: BaseStatus.loading, errorMessage: ''));
    final result = await _registerUseCase.call(registerRequest);
    result.when(
      (data) async {
        emit(state.copyWith(baseStatus: BaseStatus.success));
      },
      (error) {
        emit(
          state.copyWith(
            baseStatus: BaseStatus.error,
            errorMessage: error.message,
          ),
        );
      },
    );
  }
}
