import 'package:flutter/material.dart';

class AboutPlaylist extends StatelessWidget {
  const AboutPlaylist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Liked Songs',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          '10 songs',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
