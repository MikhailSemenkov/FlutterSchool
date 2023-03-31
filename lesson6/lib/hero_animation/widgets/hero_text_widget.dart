import 'package:flutter/material.dart';

class HeroText extends StatelessWidget {
  const HeroText(
      {Key? key,
      required String tag,
      required String text,
      required double fontSize,
      required Color textColor,
      required FontWeight fontWeight})
      : _textColor = textColor,
        _fontSize = fontSize,
        _text = text,
        _tag = tag,
        _fontWeight = fontWeight,
        super(key: key);

  final String _tag;
  final String _text;
  final double _fontSize;
  final Color _textColor;
  final FontWeight _fontWeight;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _tag,
      child: Material(
        type: MaterialType.transparency,
        child: FittedBox(
          child: Text(
            _text,
            style: TextStyle(
              fontSize: _fontSize,
              color: _textColor,
              fontWeight: _fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
