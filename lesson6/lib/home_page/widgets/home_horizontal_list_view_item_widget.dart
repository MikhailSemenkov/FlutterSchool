import 'package:flutter/material.dart';

class HorizontalListViewItem extends StatelessWidget {
  const HorizontalListViewItem({
    super.key,
    required Color coverColor,
    required String title,
  })  : _title = title,
        _coverColor = coverColor;

  final Color _coverColor;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            color: _coverColor,
          ),
          Text(_title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
