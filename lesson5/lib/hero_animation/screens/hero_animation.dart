import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:lesson5/player_page/screens/player.dart';

import '../../navigation_bar/widgets/navigation_bar_now_playing_composition_widget.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return NowPlayingComposition(
      author: 'David Bowie',
      compositionName: 'Heroes',
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
          return const PlayerScreen(
            playingFrom: 'YOUR LIBRARY',
            playlistName: 'Liked Songs',
            compositionName: 'Heroes',
            author: 'David Bowie',
          );
        }));
      },
    );
  }
}
