import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    super.key,
    required String title,
  }) : _title = title;

  final String _title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
      ),
      onPressed: null,
      child: Text(
        _title,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
