part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final BaseStatus baseStatus;
  final String errorMessage;

  const RegisterState({
    this.baseStatus = BaseStatus.initial,
    this.errorMessage = '',
  });

  factory RegisterState.initial() => const RegisterState();

  RegisterState copyWith({BaseStatus? baseStatus, String? errorMessage}) {
    return RegisterState(
      baseStatus: baseStatus ?? this.baseStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [baseStatus, errorMessage];
}
