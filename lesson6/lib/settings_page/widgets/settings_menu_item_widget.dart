import 'package:flutter/material.dart';

import 'settings_menu_item_info_widget.dart';

class SettingsMenuItem extends StatelessWidget {
  const SettingsMenuItem({
    super.key,
    required String title,
    required String description,
  })  : _description = description,
        _title = title;

  final String _title;
  final String _description;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        overlayColor: MaterialStatePropertyAll(Colors.transparent),
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
        ),
      ),
      onPressed: () {},
      child: SettingsMenuItemInfo(
        title: _title,
        description: _description,
      ),
    );
  }
}
