import 'package:flutter/material.dart';

import '../../hero_animation/widgets/hero_composition_cover_widget.dart';
import '../widgets/player_about_composition_widget.dart';
import '../widgets/player_app_bar_widget.dart';
import '../widgets/player_bottom_bar_widget.dart';
import '../widgets/player_control_panel_widget.dart';
import '../widgets/player_progress_bar_widget.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen(
      {Key? key,
      required String playingFrom,
      required String playlistName,
      required String compositionName,
      required String author})
      : _author = author,
        _compositionName = compositionName,
        _playlistName = playlistName,
        _playingFrom = playingFrom,
        super(key: key);

  final String _playingFrom;
  final String _playlistName;
  final String _compositionName;
  final String _author;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool _isPlaying = false;

  void _changePlaying() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PlayerAppBar(
        playingFrom: widget._playingFrom,
        playlistName: widget._playlistName,
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
                compositionName: widget._compositionName,
                author: widget._author),
            ProgressBar(
                isPlaying: _isPlaying,
                duration: const Duration(minutes: 6, seconds: 11)),
            ControlPanel(playOnPressed: _changePlaying),
            const BottomBar(),
          ],
        ),
      ),
    );
  }
}
