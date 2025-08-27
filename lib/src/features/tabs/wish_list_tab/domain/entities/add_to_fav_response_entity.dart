import 'package:equatable/equatable.dart';

class AddToFavResponseEntity extends Equatable {
  final String? status;
  final String? message;
  final List<String>? data;

  const AddToFavResponseEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];
}
