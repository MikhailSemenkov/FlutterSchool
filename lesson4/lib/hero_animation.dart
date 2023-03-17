import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:lesson4/navigation_bar.dart';
import 'package:lesson4/player.dart';

class HeroAnimation extends StatelessWidget {
  const HeroAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0;
    return NowPlayingCompositionWidget(
      author: 'David Bowie',
      compositionName: 'Heroes',
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) {
          return const Player(
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
