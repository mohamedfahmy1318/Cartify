import 'package:equatable/equatable.dart';

class AddressResponseEntity extends Equatable {
  final int? results;
  final String? message;
  final List<AddressEntity>? data;

  const AddressResponseEntity({
    this.results,
    this.message,
    this.data,
  });

  @override
  List<Object?> get props => [results, message, data];

}
class AddressEntity extends Equatable {
  final String? id;
  final String? city;
  final String? name;
  final String? details;
  final String? phone;

  const AddressEntity({
    this.id,
    this.city,
    this.name,
    this.details,
    this.phone, 
  });

  @override
  List<Object?> get props => [
        id,
        city,
        name,
        details,
        phone,
      ];
}