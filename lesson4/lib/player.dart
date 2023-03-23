import 'package:flutter/material.dart';

import 'composition_cover.dart';

class Player extends StatelessWidget {
  const Player(
      {Key? key,
      required this.playingFrom,
      required this.playlistName,
      required this.compositionName,
      required this.author})
      : super(key: key);

  final String playingFrom;
  final String playlistName;
  final String compositionName;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.expand_more,
            size: 40,
          ),
        ),
        centerTitle: true,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'PLAYING FROM $playingFrom',
              style: const TextStyle(fontSize: 10),
            ),
            Text(
              playlistName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 25,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          children: [
            const Expanded(
              child: Hero(
                tag: 'CompositionCover',
                child: CompositionCover(image: 'images/bowie_heroes.jpg'),
              ),
            ),
            _AboutCompositionBar(
                compositionName: compositionName, author: author),
            const _ProgressBar(),
            const _ControlPanel(),
            const _BottomBar(),
          ],
        ),
      ),
    );
  }
}

class _AboutCompositionBar extends StatelessWidget {
  const _AboutCompositionBar(
      {Key? key, required this.compositionName, required this.author})
      : super(key: key);

  final String compositionName;
  final String author;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: 'CompositionName',
                      child: Material(
                        type: MaterialType.transparency,
                        child: FittedBox(
                          child: Text(
                            compositionName,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Hero(
                      tag: 'CompositionAuthor',
                      child: Material(
                        type: MaterialType.transparency,
                        child: FittedBox(
                          child: Text(
                            author,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  const _ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: const LinearProgressIndicator(
            value: 0.75,
            backgroundColor: Color(0xff444444),
            color: Colors.white,
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '4:31',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            Text(
              '6:11',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _ControlPanel extends StatelessWidget {
  const _ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shuffle,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_previous,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.play_circle_fill,
            size: 80,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.repeat,
            size: 30,
          ),
        ),
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.speaker),
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
