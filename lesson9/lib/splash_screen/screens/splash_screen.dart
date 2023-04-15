import 'package:flutter/material.dart';

import '../painter/logo_painter.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CustomPaint(
            painter: LogoPainter(),
          ),
        ),
      ),
    );
  }
}
