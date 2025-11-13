import 'package:shopverse/core/models/tokens_model.dart';

class UserModel {
  final String userId;
  final String email;
  final String firstName;
  final String lastName;
  final String? profilePicture;
  final TokensModel tokens;

  UserModel({
    required this.userId,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.profilePicture,
    required this.tokens,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      profilePicture: json['profilePicture'],
      tokens: TokensModel.fromJson(json['tokens'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": {
        "userId": userId,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "profilePicture": profilePicture,
      },
      "tokens": tokens.toJson(),
    };
  }
}

