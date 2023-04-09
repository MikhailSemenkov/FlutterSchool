import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required String title,
    required String description,
    required Function onTap,
  })  : _description = description,
        _title = title,
        _onTap = onTap;

  final String _title;
  final String _description;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ListTile(
        onTap: _onTap(),
        title: Text(
          _title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          _description,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        leading: const Icon(
          Icons.image,
          size: 60,
        ),
      );
    });
  }
}
