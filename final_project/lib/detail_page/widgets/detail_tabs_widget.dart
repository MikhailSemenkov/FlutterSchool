import 'package:final_project/data/movies.dart';
import 'package:final_project/detail_page/widgets/about_movie_list_widget.dart';
import 'package:final_project/detail_page/widgets/sessions_list_widget.dart';
import 'package:flutter/material.dart';

import 'comments_list_widget.dart';

class DetailTabsWidget extends StatefulWidget {
  const DetailTabsWidget({Key? key, required Movie movie})
      : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  State<DetailTabsWidget> createState() => _DetailTabsWidgetState();
}

class _DetailTabsWidgetState extends State<DetailTabsWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            labelColor: theme.colorScheme.secondary,
            unselectedLabelColor: Colors.white,
            splashBorderRadius: BorderRadius.circular(10),
            splashFactory: InkRipple.splashFactory,
            tabs: const [
              Tab(icon: Icon(Icons.info_outline)),
              Tab(icon: Icon(Icons.theaters_outlined)),
              Tab(icon: Icon(Icons.rate_review_outlined)),
            ],
          ),
          Flexible(
            child: ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: TabBarView(
                children: [
                  AboutMovieListWidget(movie: widget._movie),
                  SessionsListWidget(
                    movie: widget._movie,
                  ),
                  CommentsListWidget(
                    movieId: widget._movie.id!,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
