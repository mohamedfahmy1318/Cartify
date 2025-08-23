import 'package:full_ecommerce_app/src/features/auth/forgot_password/domain/entities/forgot_password_entity.dart';

class ForgotPasswordResponse extends ForgotPasswordEntity {
  const ForgotPasswordResponse({
    required super.message,
    required super.statusMsg,
  });

  factory ForgotPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgotPasswordResponse(
      message: json['message'],
      statusMsg: json['statusMsg'],
    );
  }
}
