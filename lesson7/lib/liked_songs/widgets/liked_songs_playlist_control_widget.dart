import 'package:flutter/material.dart';

class PlaylistControl extends StatelessWidget {
  const PlaylistControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () {},
          child: Text(
            'Enhance',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.south,
          ),
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shuffle,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.play_circle_fill,
            color: Theme.of(context).primaryColor,
            size: 60,
          ),
        ),
      ],
    );
  }
}
