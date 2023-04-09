import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/home_content_choose_bar_widget.dart';
import '../widgets/home_horizontal_list_view_item_widget.dart';
import '../widgets/home_top_bar_widget.dart';
import '../widgets/home_vertical_list_view_item_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TopBar(),
              const ContentChooseBar(),
              VerticalListViewItem(
                  title: 'Made for you', items: _generateItems(5)),
              VerticalListViewItem(
                  title: 'Recently played', items: _generateItems(5)),
              VerticalListViewItem(
                  title: 'Your top mixes', items: _generateItems(5)),
            ],
          ),
        ),
      ],
    );
  }

  static List<Widget> _generateItems(int amountOfItems) {
    randomColor() => Color(Random().nextInt(0xffffffff));
    return <Widget>[
      for (int i = 0; i < amountOfItems; i++)
        HorizontalListViewItem(
          coverColor: randomColor(),
          title: 'It is playlist special for you',
        ),
    ];
  }
}
