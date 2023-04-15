import 'dart:math';

import 'package:flutter/material.dart';

import '../../navigator/navigator_keys.dart';
import '../widgets/home_content_choose_bar_widget.dart';
import '../widgets/home_horizontal_list_view_item_widget.dart';
import '../widgets/home_top_bar_widget.dart';
import '../widgets/home_vertical_list_view_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

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

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
      key: NavigatorKeys.navigatorKeyHomePage,
      initialRoute: '/',
      onGenerateRoute: (route) => MaterialPageRoute(
        builder: (context) => ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const TopBar(),
                  const ContentChooseBar(),
                  VerticalListViewItem(
                      title: 'Made for you',
                      items: HomeScreen._generateItems(5)),
                  VerticalListViewItem(
                      title: 'Recently played',
                      items: HomeScreen._generateItems(5)),
                  VerticalListViewItem(
                      title: 'Your top mixes',
                      items: HomeScreen._generateItems(5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
