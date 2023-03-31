import 'package:flutter/material.dart';
import 'package:lesson6/settings_page/screens/settings_screen.dart';
import 'package:provider/provider.dart';

import '../../player_page/state/player_model.dart';

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
            final playerModel =
                Provider.of<PlayerModel>(context, listen: false);
            return IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider.value(
                    value: playerModel,
                    child: SettingsScreen(
                      changeTab: _changeTab,
                    ),
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
