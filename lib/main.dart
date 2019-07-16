import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(AuthApp());

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OAuth',
      home: Scaffold(
        body: Center(
          child: LoginPage(),
        ),
      ),
    );
  }
}