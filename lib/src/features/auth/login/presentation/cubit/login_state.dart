part of 'login_cubit.dart';

class LoginState extends Equatable {
  final BaseStatus baseStatus;
  final String errorMessage;

  const LoginState({
    this.baseStatus = BaseStatus.initial,
    this.errorMessage = '',
  });

  factory LoginState.initial() => const LoginState();

  LoginState copyWith({BaseStatus? baseStatus, String? errorMessage}) {
    return LoginState(
      baseStatus: baseStatus ?? this.baseStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [baseStatus, errorMessage];
}
