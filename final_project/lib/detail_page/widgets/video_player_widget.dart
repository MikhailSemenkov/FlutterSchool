import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {Key? key,
      required String trailerUrl,
      required Widget Function(Widget) builder})
      : _builder = builder,
        _trailerUrl = trailerUrl,
        super(key: key);

  final String _trailerUrl;
  final Widget Function(Widget player) _builder;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget._trailerUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        enableCaption: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      onExitFullScreen: () {
        SystemChrome.setPreferredOrientations(DeviceOrientation.values);
      },
      player: YoutubePlayer(
        thumbnail: Image.network(
          'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(widget._trailerUrl)}/0.jpg',
          fit: BoxFit.fitWidth,
        ),
        controller: _controller,
        showVideoProgressIndicator: true,
        onEnded: (date) {
          _controller.seekTo(const Duration(seconds: 0));
          _controller.pause();
        },
      ),
      builder: (context, player) => widget._builder(player),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
