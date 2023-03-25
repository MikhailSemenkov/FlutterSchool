import 'package:flutter/material.dart';
import 'package:lesson5/hero_animation/screens/hero_animation.dart';

import '../widgets/navigation_bar_item_widget.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar(
      {Key? key, required Function changeTab, required int pageNumber})
      : _pageNumber = pageNumber,
        _changeTab = changeTab,
        super(key: key);

  final Function _changeTab;
  final int _pageNumber;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const HeroAnimation(),
          NavigationBar(
            backgroundColor: Colors.black,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (int index) {
              setState(() {
                widget._changeTab(index);
              });
            },
            selectedIndex: widget._pageNumber,
            destinations: const <Widget>[
              NavigationItemWidget(
                selectedIcon: Icons.home,
                icon: Icons.home_outlined,
                label: 'Home',
              ),
              NavigationItemWidget(
                selectedIcon: Icons.saved_search_rounded,
                icon: Icons.search,
                label: 'Search',
              ),
              NavigationItemWidget(
                selectedIcon: Icons.bookmark,
                icon: Icons.bookmark_border,
                label: 'Your Library',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
