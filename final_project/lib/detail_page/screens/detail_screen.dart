import 'package:flutter/material.dart';

import '../../data/movies.dart';
import '../curves/player_transition_curve.dart';
import '../widgets/detail_tabs_widget.dart';
import '../widgets/main_movie_info.dart';
import '../widgets/video_player_widget.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {Key? key, required Movie movie, required Animation<double> animation})
      : _animation = animation,
        _movie = movie,
        super(key: key);

  final Movie _movie;
  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Hero(
          tag: '${_movie.name!} ${_movie.year}',
          child: Material(
            type: MaterialType.transparency,
            child: FittedBox(
              child: Text(
                '${_movie.name!} (${_movie.year.toString()})',
                style: theme.textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ),
      body: VideoPlayerWidget(
        trailerUrl: _movie.trailer!,
        builder: (player) => Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Hero(
                      tag: _movie.image!,
                      child: Image.network(
                        _movie.smallImage!,
                        fit: BoxFit.contain,
                      ),
                    ),
                    MainMovieInfo(
                      movie: _movie,
                    ),
                  ],
                ),
              ),
              Builder(builder: (context) {
                Animation<double> animation = CurvedAnimation(
                    parent: _animation, curve: PlayerTransitionCurve());
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Trailer',
                        style: theme.textTheme.titleMedium,
                      ),
                    ),
                    FadeTransition(
                      opacity: animation,
                      child: player,
                    ),
                  ],
                );
              }),
              Expanded(
                flex: 2,
                child: DetailTabsWidget(movie: _movie),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
