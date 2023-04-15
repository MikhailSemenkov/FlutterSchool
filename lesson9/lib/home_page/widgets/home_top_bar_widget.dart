import 'package:flutter/material.dart';

import '../../navigator/navigator_keys.dart';
import '../../settings_page/screens/settings_screen.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Good evening',
          style: Theme.of(context).textTheme.headlineMedium,
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
        IconButton(
          onPressed: () =>
              Navigator.of(NavigatorKeys.navigatorKeyHomePage.currentContext!)
                  .push(
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          ),
          icon: const Icon(
            Icons.settings_outlined,
            size: 30,
          ),
        ),
      ],
    );
  }
}
