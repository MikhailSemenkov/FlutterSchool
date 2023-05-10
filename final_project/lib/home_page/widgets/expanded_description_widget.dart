import 'package:flutter/material.dart';

import '../../data/movies.dart';

class ExpandedDescriptionWidget extends StatelessWidget {
  const ExpandedDescriptionWidget(
      {Key? key, required Movie movie, required bool isExpanded})
      : _isExpanded = isExpanded,
        _movie = movie,
        super(key: key);

  final Movie _movie;
  final bool _isExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _isExpanded
              ? SizedBox(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _movie.plot ?? 'Can not find movie description.',
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 25),
          Hero(
            tag: '${_movie.name!} ${_movie.year}',
            child: Material(
              type: MaterialType.transparency,
              child: FittedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${_movie.name!} (${_movie.year})',
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
