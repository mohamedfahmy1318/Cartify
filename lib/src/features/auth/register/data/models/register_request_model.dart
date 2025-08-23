class RegisterRequestModel {
  final String name;
  final String phone;
  final String email;
  final String password;
  final String rePassword;
  RegisterRequestModel(
    this.name,
    this.phone,
    this.email,
    this.password,
    this.rePassword,
  );
  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'email': email,
    'password': password,
    'rePassword': rePassword,
  };
}
