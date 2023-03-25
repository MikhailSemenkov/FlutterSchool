import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required Color backgroundColor,
    required String title,
  })  : _title = title,
        _backgroundColor = backgroundColor;

  final Color _backgroundColor;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: FilledButton(
        onPressed: null,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: _backgroundColor,
          disabledBackgroundColor: _backgroundColor,
          disabledForegroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 0),
          alignment: Alignment.topLeft,
        ),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                _title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
