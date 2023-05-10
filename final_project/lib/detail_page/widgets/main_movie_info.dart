import 'package:flutter/material.dart';

import '../../data/movies.dart';
import 'rating_indicator_widget.dart';

class MainMovieInfo extends StatelessWidget {
  const MainMovieInfo({Key? key, required Movie movie})
      : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);

    return Container(
      height: size.height / 6,
      width: size.width * 0.5,
      decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              width: 150,
              child: RatingIndicatorWidget(
                rating: double.parse(_movie.rating!),
              ),
            ),
            Text(
              '${_movie.age!}+',
              style: theme.textTheme.bodySmall,
            ),
            Text(
              _movie.genre!,
              style: theme.textTheme.bodySmall,
            ),
            Text(
              '${(_movie.duration! / 60).floor()}h ${_movie.duration! % 60}min',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
