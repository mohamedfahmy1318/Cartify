class UserModel {
  final String? id;
  final String name;
  final String email;
  final String role;
  final String? image;
  final String? phone;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.role,
    this.image,
    this.phone,
  });

  factory UserModel.initial() => UserModel(
    id: null,
    name: '',
    email: '',
    role: 'user',
    image: null,
    phone: null,
  );

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
    String? image,
    String? phone,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
      image: image ?? this.image,
      phone: phone ?? this.phone,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"]?.toString(),
    name: json["name"]?.toString() ?? '',
    email: json["email"]?.toString() ?? '',
    role: json["role"]?.toString() ?? 'user',
    image: json["image"]?.toString(),
    phone: json["phone"]?.toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "role": role,
    "image": image,
    "phone": phone,
  };
}

class UserAuthResponse {
  final String message;
  final UserModel user;
  final String token;

  UserAuthResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  factory UserAuthResponse.fromJson(Map<String, dynamic> json) => UserAuthResponse(
    message: json["message"]?.toString() ?? '',
    user: UserModel.fromJson(json["user"] ?? {}),
    token: json["token"]?.toString() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
    "token": token,
  };
}
