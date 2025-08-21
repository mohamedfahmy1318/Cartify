class UserModel {
  final int id;
  final String name;
  final String lastName;
  final String? image;
  final String email;
  final String phone;
  final String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.lastName,
    this.image,
    required this.email,
    required this.phone,
    this.token,
  });

  String get fullName => '$name $lastName';

  factory UserModel.initial() => UserModel(
    id: 0,
    name: '',
    lastName: '',
    image: null,
    email: '',
    phone: '',
    token: null,
  );

  UserModel copyWith({
    int? id,
    String? name,
    String? lastName,
    String? image,
    String? email,
    String? phone,
    String? token,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      image: image ?? this.image,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      token: token ?? this.token,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: int.tryParse(json["id"]?.toString() ?? "0") ?? 0,
    name: json["name"]?.toString() ?? '',
    lastName: json["last_name"]?.toString() ?? '',
    image: json["image"]?.toString(),
    email: json["email"]?.toString() ?? '',
    phone: json["phone"]?.toString() ?? '',
    token: json["token"]?.toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "last_name": lastName,
    "image": image,
    "email": email,
    "phone": phone,
  };
}
