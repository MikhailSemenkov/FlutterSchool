import 'package:flutter/material.dart';

import '../../data/movies.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required Movie movie,
  })  : _movie = movie,
        super(key: key);

  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: _movie.image!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          _movie.image!,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
