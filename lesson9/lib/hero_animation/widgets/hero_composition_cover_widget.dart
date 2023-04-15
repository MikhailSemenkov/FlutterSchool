import 'package:flutter/material.dart';

class CompositionCover extends StatelessWidget {
  const CompositionCover({Key? key, required String image, required String tag})
      : _image = image,
        _tag = tag,
        super(key: key);

  final String _image;
  final String _tag;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _tag,
      child: SizedBox(
        child: Image.asset(
          fit: BoxFit.contain,
          _image,
        ),
      ),
    );
  }
}
