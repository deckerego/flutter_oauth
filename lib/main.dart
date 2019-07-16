import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(AuthApp());

class AuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter OAuth',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Authenticted User'),
        ),
        body: Center(
          child: LoginPage(),
        ),
      ),
    );
  }
}