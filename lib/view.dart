import 'package:flutter/material.dart';

class ViewUser extends StatelessWidget {
  final String token;

  ViewUser({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Authenticated User'),
        ),
        body: Center(
          child: Text(this.token),
        ),
      );
  }
}