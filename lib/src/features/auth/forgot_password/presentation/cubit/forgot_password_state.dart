import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';

class ForgotPasswordState extends Equatable {
  final BaseStatus baseStatus;
  final String errorMessage;

  const ForgotPasswordState({
    this.baseStatus = BaseStatus.initial,
    this.errorMessage = '',
  });

  factory ForgotPasswordState.initial() => const ForgotPasswordState();

  ForgotPasswordState copyWith({BaseStatus? baseStatus, String? errorMessage}) {
    return ForgotPasswordState(
      baseStatus: baseStatus ?? this.baseStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [baseStatus, errorMessage];
}
