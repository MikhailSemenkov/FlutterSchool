import 'dart:math';

import 'package:flutter/material.dart';

class HomePage {
  Widget getWidget() {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _topBar(),
              _contentChooseBar(),
              _verticalListViewItem('Made for you', generateItems(5)),
              _verticalListViewItem('Recently played', generateItems(5)),
              _verticalListViewItem('Your top mixes', generateItems(5)),
            ],
          ),
        ),
      ],
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

  Widget _topBar() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Good evening',
          style: TextStyle(fontSize: 25),
        ),
        Row(
          children: [
            IconButton(
                onPressed: null,
                icon: Icon(Icons.notifications_none_outlined, size: 30)),
            IconButton(onPressed: null, icon: Icon(Icons.history, size: 30)),
            IconButton(
                onPressed: null, icon: Icon(Icons.settings_outlined, size: 30)),
          ],
        )
      ],
    );
  }

  Widget _contentChooseBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: null,
            child: const Text(
              'Music',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: null,
            child: const Text(
              'Podcasts & Shows',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
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
