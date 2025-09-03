import 'package:full_ecommerce_app/src/features/checkout/domain/entities/address_response_entity.dart';

/// Address API response model
/// Example payload:
/// {
///   "results": 2,
///   "message": "success",
///   "data": [ ...addresses... ]
/// }
class AddressResponseModel extends AddressResponseEntity {
  const AddressResponseModel({
    super.results,
    super.message,
    super.data,
    super.status,
  });

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) {
    return AddressResponseModel(
      results: json['results'] as int? ?? (json['data'] as List?)?.length ?? 0,
      message: json['message'] as String? ?? '',
      status: json['status'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results,
      'message': message,
      'status': status,
      'data': data?.map((e) => (e as AddressModel).toJson()).toList(),
    };
  }

  AddressResponseEntity toEntity() {
    return AddressResponseEntity(
      results: results,
      message: message,
      status: status,
      data: data?.map((e) => (e as AddressModel).toEntity()).toList(),
    );
  }
}

/// Individual address model
class AddressModel extends AddressEntity {
  const AddressModel({
    super.id,
    super.city,
    super.name,
    super.details,
    super.phone,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['_id'] as String? ?? json['id'] as String?,
      city: json['city'] as String? ?? '',
      name: json['name'] as String? ?? '',
      details: json['details'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'city': city,
      'name': name,
      'details': details,
      'phone': phone,
    };
  }

  AddressEntity toEntity() {
    return AddressEntity(
      id: id,
      city: city,
      name: name,
      details: details,
      phone: phone,
    );
  }

  /// Create a copy of this address with updated fields
  AddressModel copyWith({
    String? id,
    String? city,
    String? name,
    String? details,
    String? phone,
  }) {
    return AddressModel(
      id: id ?? this.id,
      city: city ?? this.city,
      name: name ?? this.name,
      details: details ?? this.details,
      phone: phone ?? this.phone,
    );
  }

  /// Check if the address has all required fields
  bool get isValid =>
      (name?.isNotEmpty ?? false) &&
      (phone?.isNotEmpty ?? false) &&
      (city?.isNotEmpty ?? false) &&
      (details?.isNotEmpty ?? false);

  /// Get formatted address string
  String get formattedAddress {
    final parts = [details, city].where((part) => part?.isNotEmpty ?? false);
    return parts.join(', ');
  }

  /// Get display name for the address
  String get displayName => name ?? 'Unnamed Address';
}