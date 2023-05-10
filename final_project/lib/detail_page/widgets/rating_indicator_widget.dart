import 'package:flutter/material.dart';

class RatingIndicatorWidget extends StatelessWidget {
  const RatingIndicatorWidget({Key? key, required double rating})
      : _rating = rating,
        super(key: key);

  final double _rating;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          ...List.generate(
            5,
            (index) {
              final value = _rating - index;
              if (value >= 1) {
                return const Icon(
                  Icons.star,
                  color: Colors.amber,
                );
              }
              if (value > 0) {
                return ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (Rect rect) {
                    return LinearGradient(
                      stops: [0, value, value],
                      colors: [
                        Colors.amber,
                        Colors.amber,
                        Colors.amber.withOpacity(0),
                      ],
                    ).createShader(rect);
                  },
                  child: const Icon(
                    Icons.star,
                    color: Colors.grey,
                  ),
                );
              } else {
                return const Icon(
                  Icons.star,
                  color: Colors.grey,
                );
              }
            },
          ),
          Text(
            '($_rating)',
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}
