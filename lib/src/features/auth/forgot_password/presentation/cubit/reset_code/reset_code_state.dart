import 'package:equatable/equatable.dart';
import 'package:full_ecommerce_app/src/core/shared/base_state.dart';

class ResetCodeState extends Equatable {
  final BaseStatus baseStatus;
  final String errorMessage;

  const ResetCodeState({
    this.baseStatus = BaseStatus.initial,
    this.errorMessage = '',
  });

  factory ResetCodeState.initial() => const ResetCodeState();

  ResetCodeState copyWith({BaseStatus? baseStatus, String? errorMessage}) {
    return ResetCodeState(
      baseStatus: baseStatus ?? this.baseStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [baseStatus, errorMessage];
}
