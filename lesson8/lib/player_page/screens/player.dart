import 'package:flutter/material.dart';

import '../../hero_animation/widgets/hero_composition_cover_widget.dart';
import '../widgets/player_about_composition_widget.dart';
import '../widgets/player_app_bar_widget.dart';
import '../widgets/player_bottom_bar_widget.dart';
import '../widgets/player_control_panel_widget.dart';
import '../widgets/player_progress_bar_widget.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({
    Key? key,
    required String playingFrom,
    required String playlistName,
    required String compositionName,
    required String author,
    required Duration duration,
  })  : _author = author,
        _compositionName = compositionName,
        _playlistName = playlistName,
        _playingFrom = playingFrom,
        _duration = duration,
        super(key: key);

  final String _playingFrom;
  final String _playlistName;
  final String _compositionName;
  final String _author;
  final Duration _duration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlayerAppBar(
        playingFrom: _playingFrom,
        playlistName: _playlistName,
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            const Expanded(
              child: CompositionCover(
                image: 'images/bowie_heroes.jpg',
                tag: 'CompositionCover',
              ),
            ),
            AboutCompositionBar(
                compositionName: _compositionName, author: _author),
            ProgressBar(
              duration: _duration,
            ),
            const ControlPanel(),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
