import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/features/auth/login/data/models/login_request_model.dart';
import 'package:full_ecommerce_app/src/features/auth/login/domain/use_cases/login_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(LoginState.initial());

  /// Reset the login state to initial
  void resetState() {
    emit(LoginState.initial());
  }

  /// Clear error message
  void clearError() {
    emit(state.copyWith(baseStatus: BaseStatus.initial, errorMessage: ''));
  }

  Future<void> login(LoginRequestModel loginRequest) async {
    emit(state.copyWith(baseStatus: BaseStatus.loading, errorMessage: ''));

    final result = await _loginUseCase.call(loginRequest);

    result.when(
      (data) async {
        // Save user data to UserCubit
        await sl<UserCubit>().setUserLoggedIn(
          user: data.user,
          token: data.token,
        );
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
