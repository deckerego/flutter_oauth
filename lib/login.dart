import 'dart:async';
import 'view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const String loginUrl = "";
const String clientId = "";
const String redirectUrl = "";

void main() => runApp(LoginPage());

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  String token;

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.close();

    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        setState(() {
          if (url.startsWith(redirectUrl)) {
            RegExp regExp = new RegExp("\\?code=(.*)");
            this.token = regExp.firstMatch(url)?.group(1);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewUser(token: token),
              ),
            );

            flutterWebViewPlugin.close();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _onUrlChanged.cancel();
    flutterWebViewPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String encodedRedirectUrl = Uri.encodeFull(redirectUrl);
    String url = "$loginUrl?client_id=$clientId&redirect_uri=$encodedRedirectUrl&response_type=code";
    return new WebviewScaffold(
        url: url
    );
  }
}