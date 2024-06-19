import 'dart:convert';

class User {
  String email;
  String password;

  User({required this.email, required this.password});

  Map<String, String> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}