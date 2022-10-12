import 'dart:convert';

class RegisterUserModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      confirmPassword: map['confirm_password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserModel.fromJson(String source) =>
      RegisterUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
