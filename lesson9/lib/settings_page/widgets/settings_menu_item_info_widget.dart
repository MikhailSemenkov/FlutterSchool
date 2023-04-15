import 'package:flutter/material.dart';

class SettingsMenuItemInfo extends StatelessWidget {
  const SettingsMenuItemInfo(
      {Key? key, required String title, required String description})
      : _description = description,
        _title = title,
        super(key: key);

  final String _title;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          _description,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
