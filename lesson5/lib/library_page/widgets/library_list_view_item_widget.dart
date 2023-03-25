import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required String title,
    required String description,
  })  : _description = description,
        _title = title;

  final String _title;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      title: Text(
        _title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
      subtitle: Text(
        _description,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 12,
        ),
      ),
      leading: const Icon(
        Icons.image,
        size: 60,
      ),
    );
  }
}
