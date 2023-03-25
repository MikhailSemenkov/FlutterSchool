import 'package:flutter/material.dart';

import 'settings_menu_item_info_widget.dart';

class SettingMenuItemWithToggle extends StatefulWidget {
  const SettingMenuItemWithToggle(
      {Key? key, required String title, required String description})
      : _description = description,
        _title = title,
        super(key: key);

  final String _title;
  final String _description;

  @override
  State<SettingMenuItemWithToggle> createState() =>
      _SettingMenuItemWithToggleState();
}

class _SettingMenuItemWithToggleState extends State<SettingMenuItemWithToggle> {
  bool _light = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: SettingsMenuItemInfo(
              title: widget._title,
              description: widget._description,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Switch(
            value: _light,
            activeColor: Colors.green,
            onChanged: (value) {
              setState(() {
                _light = value;
              });
            },
          )
        ],
      ),
    );
  }
}
