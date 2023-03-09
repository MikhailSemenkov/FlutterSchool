import 'dart:math';

import 'package:flutter/material.dart';

class HomePage {
  List<Widget> getWidget() {
    return <Widget>[
      _topBar(),
      _contentChooseBar(),
      _verticalListViewItem('Made for you', generateItems(5)),
      _verticalListViewItem('Recently played', generateItems(5)),
      _verticalListViewItem('Your top mixes', generateItems(5)),
    ];
  }

  Widget _topBar() {
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

  Widget _contentChooseBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          _makeFilledButton('Music'),
          const SizedBox(
            width: 20,
          ),
          _makeFilledButton('Podcasts & Shows'),
        ],
      ),
    );
  }

  Widget _makeFilledButton(String title) {
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

  List<Widget> generateItems(int amountOfItems) {
    randomColor() => Color(Random().nextInt(0xffffffff));
    List<Widget> items = [];
    for (int i = 0; i < amountOfItems; i++) {
      items.add(_horizontalListViewItem(
          randomColor(), 'It is playlist special for you'));
    }
    return items;
  }

  Widget _horizontalListViewItem(Color coverColor, String title) {
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

  Widget _verticalListViewItem(String title, List<Widget> items) {
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
