import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson7/settings_page/screens/settings_screen.dart';
import 'package:provider/provider.dart';

import '../../navigation_bar/bloc/navigation_bloc.dart';
import '../../player_page/state/player_model.dart';

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
        Builder(
          builder: (context) {
            final playerModel =
                Provider.of<PlayerModel>(context, listen: false);
            final navigationBloc = Provider.of<NavigationBloc>(context);
            return IconButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => BlocProvider.value(
                    value: navigationBloc,
                    child: ChangeNotifierProvider.value(
                      value: playerModel,
                      child: const SettingsScreen(),
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
