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
      onPressed: null,
      child: Text(
        _title,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
    );
  }
}
