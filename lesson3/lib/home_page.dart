import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const TopBar(),
        const ContentChooseBar(),
        VerticalListViewItem(title: 'Made for you', items: generateItems(5)),
        VerticalListViewItem(title: 'Recently played', items: generateItems(5)),
        VerticalListViewItem(title: 'Your top mixes', items: generateItems(5)),
      ],
    );
  }

  static List<Widget> generateItems(int amountOfItems) {
    randomColor() => Color(Random().nextInt(0xffffffff));
    return <Widget>[
      for (int i = 0; i < amountOfItems; i++)
        HorizontalListViewItem(
          coverColor: randomColor(),
          title: 'It is playlist special for you',
        ),
    ];
    // return items;
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Good evening',
          style: TextStyle(fontSize: 25),
        ),
        Expanded(child: SizedBox()),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.notifications_none_outlined, size: 30),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.history, size: 30),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.settings_outlined, size: 30),
        )
      ],
    );
  }
}

class ContentChooseBar extends StatelessWidget {
  const ContentChooseBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        children: [
          MyFilledButton(title: 'Music'),
          SizedBox(
            width: 20,
          ),
          MyFilledButton(title: 'Podcasts & Shows'),
        ],
      ),
    );
  }
}

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
      onPressed: null,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}

class VerticalListViewItem extends StatelessWidget {
  const VerticalListViewItem({
    super.key,
    required this.title,
    required this.items,
  });

  final String title;
  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: items,
          ),
        ),
      ],
    );
  }
}

class HorizontalListViewItem extends StatelessWidget {
  const HorizontalListViewItem({
    super.key,
    required this.coverColor,
    required this.title,
  });

  final Color coverColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 150,
            color: coverColor,
          ),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
