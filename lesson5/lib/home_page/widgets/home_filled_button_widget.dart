import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({
    super.key,
    required String title,
  }) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
      onPressed: null,
      child: Text(
        _title,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
