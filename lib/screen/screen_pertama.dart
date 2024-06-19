import 'package:flutter/material.dart';
import 'package:project_akhir/screen/login_screen.dart';

class PertamaScreen extends StatelessWidget {
  const PertamaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pertama Screen'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              // Log out and navigate to login screen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Welcome to Pertama Screen!'),
      ),
    );
  }
}