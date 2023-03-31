import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:lesson6/player_page/screens/player.dart';
import 'package:lesson6/player_page/state/player_model.dart';
import 'package:provider/provider.dart';

import '../../navigation_bar/widgets/navigation_bar_now_playing_composition_widget.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  final Duration _duration = const Duration(minutes: 6, seconds: 11);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return NowPlayingComposition(
      author: 'David Bowie',
      compositionName: 'Heroes',
      duration: _duration,
      onTap: () {
        final playerModel = Provider.of<PlayerModel>(context, listen: false);
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => ChangeNotifierProvider.value(
              value: playerModel,
              child: PlayerScreen(
                playingFrom: 'YOUR LIBRARY',
                playlistName: 'Liked Songs',
                compositionName: 'Heroes',
                author: 'David Bowie',
                duration: _duration,
              ),
            ),
          ),
        );
      },
    );
  }
}
