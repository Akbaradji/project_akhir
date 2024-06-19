import 'package:flutter/material.dart';
import 'package:project_akhir/screen/login_screen.dart';
import 'package:project_akhir/screen/register_screen.dart';
import 'package:project_akhir/screen/screen_pertama.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kuliner App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(), // Start with LoginScreen
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/pertama': (context) => PertamaScreen(),
      },
    );
  }
}
