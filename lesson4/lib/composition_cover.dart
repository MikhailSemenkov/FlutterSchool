import 'package:flutter/material.dart';

class CompositionCover extends StatelessWidget {
  const CompositionCover({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Image.asset(
        image,
        fit: BoxFit.contain,
      ),
    );
  }
}
