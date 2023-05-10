import 'package:final_project/home_page/widgets/image_widget.dart';
import 'package:flutter/material.dart';

import '../../data/movies.dart';
import '../../detail_page/screens/detail_screen.dart';
import 'expanded_description_widget.dart';

class MovieWidget extends StatefulWidget {
  const MovieWidget({
    Key? key,
    required Movie movie,
    required double viewportFraction,
  })  : _movie = movie,
        _viewportFraction = viewportFraction,
        super(key: key);

  final Movie _movie;
  final double _viewportFraction;

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  bool _isExpanded = false;

  _onPanUpdate(DragUpdateDetails details) {
    if (details.delta.dy < 0) {
      setState(() {
        _isExpanded = true;
      });
    } else if (details.delta.dy > 0) {
      setState(() {
        _isExpanded = false;
      });
    }
  }

  void _openDetailPage(Movie movie) {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(seconds: 1),
        reverseTransitionDuration: const Duration(seconds: 1),
        pageBuilder: (context, animation, secondaryAnimation) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeInQuart,
          );
          return FadeTransition(
            opacity: curvedAnimation,
            child: DetailScreen(
              movie: movie,
              animation: curvedAnimation,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          top: 100,
          width: size.width * widget._viewportFraction,
          height: size.width * widget._viewportFraction * 1.5 +
              (_isExpanded ? 100 : 50),
          child: ExpandedDescriptionWidget(
            movie: widget._movie,
            isExpanded: _isExpanded,
          ),
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          width: size.width * widget._viewportFraction - (_isExpanded ? 60 : 0),
          height: size.width * widget._viewportFraction * 1.5 -
              (_isExpanded ? 60 : 0),
          top: _isExpanded ? 115 : 100,
          child: GestureDetector(
            onPanUpdate: _onPanUpdate,
            onTap: () {
              _openDetailPage(widget._movie);
            },
            child: ImageWidget(
              movie: widget._movie,
            ),
          ),
        ),
      ],
    );
  }
}
