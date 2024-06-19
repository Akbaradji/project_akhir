import 'dart:convert';

import 'package:project_akhir/model/user.dart';
import 'package:project_akhir/service/user_service.dart';

class UserController {
  final userService = UserService();

  Future<Map<String, dynamic>> register(User user) async {
    try {
      var response = await userService.register(user.toMap());
      if (response.statusCode == 201) {
        return {
          'success': true,
          'message': 'Registrasi berhasil',
        };
      } else {
        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message': decodedJson['message'] ?? 'Terjadi kesalahan',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }

  Future<Map<String, dynamic>> login(User user) async {
    try {
      var response = await userService.login(user.toMap());
      if (response.statusCode == 200) {
        var decodedJson = jsonDecode(response.body);
        return {
          'success': true,
          'message': 'Login berhasil',
          'token': decodedJson['token'],
        };
      } else {
        var decodedJson = jsonDecode(response.body);
        return {
          'success': false,
          'message': decodedJson['message'] ?? 'Terjadi kesalahan',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'message': 'Terjadi kesalahan: $e',
      };
    }
  }
}