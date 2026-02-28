class RegisterModel {
  final bool success;
  final String token;
  final RegisterUser user;

  RegisterModel({
    required this.success,
    required this.token,
    required this.user,
  });

  factory RegisterModel.fromMap(Map<String, dynamic> json) {
    return RegisterModel(
      success: json['success'] ?? false,
      token: json['token'] ?? '',
      user: RegisterUser.fromMap(json['user']),
    );
  }
}

class RegisterUser {
  final int id;
  final String name;
  final String email;
  final String phone;

  RegisterUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
  });

  factory RegisterUser.fromMap(Map<String, dynamic> json) {
    return RegisterUser(
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
