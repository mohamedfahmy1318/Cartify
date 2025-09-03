import 'package:full_ecommerce_app/src/core/shared/models/user_model.dart';

/// Password Update Response Model
/// Handles both success and failure responses
class PasswordUpdateResponseModel {
  final String message;
  final UserModel? user;
  final String? token;
  final PasswordErrorModel? errors;

  const PasswordUpdateResponseModel({
    required this.message,
    this.user,
    this.token,
    this.errors,
  });

  /// Check if the password update was successful
  bool get isSuccess => message == "success";

  factory PasswordUpdateResponseModel.fromJson(Map<String, dynamic> json) {
    return PasswordUpdateResponseModel(
      message: json['message'] ?? '',
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
      token: json['token'],
      errors: json['errors'] != null 
          ? PasswordErrorModel.fromJson(json['errors']) 
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user?.toJson(),
      'token': token,
      'errors': errors?.toJson(),
    };
  }
}

/// Error model for password update failures
class PasswordErrorModel {
  final String? value;
  final String? msg;
  final String? param;
  final String? location;

  const PasswordErrorModel({
    this.value,
    this.msg,
    this.param,
    this.location,
  });

  factory PasswordErrorModel.fromJson(Map<String, dynamic> json) {
    return PasswordErrorModel(
      value: json['value'],
      msg: json['msg'],
      param: json['param'],
      location: json['location'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'value': value,
      'msg': msg,
      'param': param,
      'location': location,
    };
  }

  /// Get user-friendly error message
  String get userFriendlyMessage {
    return msg ?? 'An error occurred while updating password';
  }
}
