import 'package:flutter/material.dart';

class VerticalListViewItem extends StatelessWidget {
  const VerticalListViewItem({
    super.key,
    required String title,
    required List<Widget> items,
  })  : _items = items,
        _title = title;

  final String _title;
  final List<Widget> _items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: _items,
          ),
        ),
      ],
    );
  }
}
