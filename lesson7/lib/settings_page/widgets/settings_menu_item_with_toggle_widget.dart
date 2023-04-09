import 'package:flutter/material.dart';

import 'settings_menu_item_info_widget.dart';

class SettingMenuItemWithToggle extends StatefulWidget {
  const SettingMenuItemWithToggle({
    Key? key,
    required String title,
    required String description,
    required Function onSwitch,
    required bool isOn,
  })  : _description = description,
        _title = title,
        _onSwitch = onSwitch,
        _isOn = isOn,
        super(key: key);

  final String _title;
  final String _description;
  final Function _onSwitch;
  final bool _isOn;

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
            value: _light || widget._isOn,
            activeColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              setState(() {
                _light = value;
                widget._onSwitch();
              });
            },
          )
        ],
      ),
    );
  }
}
