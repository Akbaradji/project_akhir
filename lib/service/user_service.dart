import 'dart:convert';

import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://paml.tatiumy.com/api/';

  Uri getUri(String path) {
    return Uri.parse("$baseUrl$path");
  }

  Future<http.Response> register(Map<String, String> data) async {
    var response = await http.post(
      getUri('register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    return response;
  }

  Future<http.Response> login(Map<String, String> data) async {
    var response = await http.post(
      getUri('login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );
    return response;
  }
}
