import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/player_model.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final updatablePlayerModel =
        Provider.of<PlayerModel>(context, listen: true);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shuffle,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_previous,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () {
            updatablePlayerModel.playPressed();
          },
          isSelected:
              Provider.of<PlayerModel>(context, listen: false).isPlaying,
          icon: const Icon(
            Icons.play_circle_fill,
            size: 80,
          ),
          selectedIcon: const Icon(
            Icons.pause_circle_filled,
            size: 80,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.repeat,
            size: 30,
          ),
        ),
      ],
    );
  }
}
