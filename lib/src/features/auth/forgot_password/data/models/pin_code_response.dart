import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/entities/pin_code_entity.dart';

class PinCodeResponse extends PinCodeEntity {
  const PinCodeResponse({
    required super.message,
    required super.statusMsg,
    required super.status,
  });

  factory PinCodeResponse.fromJson(Map<String, dynamic> json) {
    return PinCodeResponse(
      message: json['message'] ?? '',
      statusMsg: json['statusMsg'] ?? '',
      status: json['status'] ?? '',
    );
  }
}
