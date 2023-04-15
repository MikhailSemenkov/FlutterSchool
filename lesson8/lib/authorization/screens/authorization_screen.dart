import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (request) {
            if (request.url.contains('example.com/?code=')) {
              Navigator.of(context).pop(request.url);
            }
            return NavigationDecision.navigate;
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)!.settings.arguments as String;
    _controller.loadRequest(
      Uri.parse('https://accounts.spotify.com/authorize?response_type=code&'
          'client_id=$id&scope=user-library-read playlist-read-private&'
          'redirect_uri=https://example.com'),
    );
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
