import 'package:flutter/material.dart';
import 'package:lesson5/settings_page/screens/settings_screen.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key, required Function changeTab})
      : _changeTab = changeTab;

  final Function _changeTab;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Good evening',
          style: TextStyle(fontSize: 25),
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_outlined, size: 30),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.history, size: 30),
        ),
        Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(
                    changeTab: _changeTab,
                  ),
                ),
              ),
              icon: const Icon(
                Icons.settings_outlined,
                size: 30,
              ),
            );
          },
        ),
      ],
    );
  }
}
