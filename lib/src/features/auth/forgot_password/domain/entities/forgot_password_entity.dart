import 'package:equatable/equatable.dart';

class ForgotPasswordEntity extends Equatable {
  final String message;
  final String statusMsg;

  const ForgotPasswordEntity({required this.message, required this.statusMsg});

  @override
  List<Object?> get props => [message, statusMsg];
}
