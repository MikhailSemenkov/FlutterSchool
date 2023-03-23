import 'package:flutter/material.dart';
import 'package:lesson4/composition_cover.dart';
import 'package:lesson4/hero_animation.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar(
      {Key? key, required this.changeTab, required this.pageCounter})
      : super(key: key);

  final Function changeTab;
  final int pageCounter;

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
                widget.changeTab(index);
              });
            },
            selectedIndex: widget.pageCounter,
            destinations: const <Widget>[
              _NavigationItemWidget(
                selectedIcon: Icons.home,
                icon: Icons.home_outlined,
                label: 'Home',
              ),
              _NavigationItemWidget(
                selectedIcon: Icons.saved_search_rounded,
                icon: Icons.search,
                label: 'Search',
              ),
              _NavigationItemWidget(
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

class NowPlayingCompositionWidget extends StatelessWidget {
  const NowPlayingCompositionWidget({
    Key? key,
    required this.author,
    required this.compositionName,
    required this.onTap,
  }) : super(key: key);

  final String author;
  final String compositionName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    onTap();
                  },
                  child: Row(
                    children: [
                      const Hero(
                        tag: 'CompositionCover',
                        child: SizedBox.square(
                          dimension: 50,
                          child: CompositionCover(
                              image: 'images/bowie_heroes.jpg'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
            const IconButton(onPressed: null, icon: Icon(Icons.speaker)),
            const IconButton(
                onPressed: null, icon: Icon(Icons.favorite_border)),
            const IconButton(onPressed: null, icon: Icon(Icons.play_arrow)),
          ],
        ),
        const LinearProgressIndicator(
          value: 0.75,
          backgroundColor: Colors.transparent,
          color: Colors.white,
        )
      ],
    );
  }
}

class _NavigationItemWidget extends StatelessWidget {
  const _NavigationItemWidget({
    required this.selectedIcon,
    required this.icon,
    required this.label,
  });

  final IconData selectedIcon;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(selectedIcon, color: Colors.white),
      icon: Icon(icon, color: Colors.grey),
      label: label,
    );
  }
}
