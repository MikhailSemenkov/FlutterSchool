import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  const HeroText(
      {Key? key,
      required String tag,
      required String text,
      required TextStyle? textStyle})
      : _text = text,
        _tag = tag,
        _textStyle = textStyle,
        super(key: key);

  final String _tag;
  final String _text;
  final TextStyle? _textStyle;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _tag,
      child: Material(
        type: MaterialType.transparency,
        child: FittedBox(
          child: Text(
            _text,
            style: _textStyle,
          ),
        ),
      ),
    );
  }
}
