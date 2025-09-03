class PasswordRequestModel {
  final String currentPassword;
  final String newPassword;
  final String reNewPassword;

  PasswordRequestModel({
    required this.currentPassword,
    required this.newPassword,
    required this.reNewPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'currentPassword': currentPassword,
      'password': newPassword,
      'rePassword': reNewPassword,
    };
  }
}
