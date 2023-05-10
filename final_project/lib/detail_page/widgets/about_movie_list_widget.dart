import 'package:final_project/data/movies.dart';
import 'package:final_project/detail_page/widgets/about_movie_list_tile_widget.dart';
import 'package:flutter/material.dart';

class AboutMovieListWidget extends StatelessWidget {
  const AboutMovieListWidget({Key? key, required Movie movie})
      : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListView(
        children: [
          AboutMovieListTileWidget(
            title: 'Synopsis',
            body: _movie.plot!,
            withDivider: true,
          ),
          AboutMovieListTileWidget(
            title: 'Country',
            body: _movie.country!,
            withDivider: true,
          ),
          AboutMovieListTileWidget(
            title: 'Staring',
            body: _movie.starring!,
            withDivider: true,
          ),
          AboutMovieListTileWidget(
            title: 'Director',
            body: _movie.director!,
            withDivider: true,
          ),
          AboutMovieListTileWidget(
            title: 'Screen writer',
            body: _movie.screenwriter!,
            withDivider: true,
          ),
          AboutMovieListTileWidget(
            title: 'Studio',
            body: _movie.studio!,
            withDivider: false,
          ),
        ],
      ),
    );
  }
}
