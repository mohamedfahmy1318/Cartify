import 'package:equatable/equatable.dart';

class PinCodeEntity extends Equatable {
  final String? message;
  final String? statusMsg;
  final String? status;

  const PinCodeEntity({this.message, this.statusMsg, required this.status});

  @override
  List<Object?> get props => [message, statusMsg, status];
}
