import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lesson4/home_page.dart';
import 'package:lesson4/library_page.dart';
import 'package:lesson4/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = debugPaintBaselinesEnabled = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lesson 3',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const NowPlayingCompositionWidget(
              author: 'David Bowie',
              compositionName: 'Heroes',
            ),
            NavigationBar(
              backgroundColor: Colors.black,
              indicatorColor: Colors.transparent,
              onDestinationSelected: (int index) {
                setState(() {
                  _pageCounter = index;
                });
              },
              selectedIndex: _pageCounter,
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
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: GetPage(pageCounter: _pageCounter),
          ),
        ],
      ),
    );
  }
}

class GetPage extends StatelessWidget {
  const GetPage({
    super.key,
    required this.pageCounter,
  });

  final int pageCounter;

  @override
  Widget build(BuildContext context) {
    switch (pageCounter) {
      case 0:
        {
          return const HomePage();
        }
      case 1:
        {
          return const SearchPage();
        }
      case 2:
        {
          return const LibraryPage();
        }
      default:
        throw 'Incorrect page number';
    }
  }
}

class NowPlayingCompositionWidget extends StatelessWidget {
  const NowPlayingCompositionWidget({
    Key? key,
    required this.author,
    required this.compositionName,
  }) : super(key: key);

  final String author;
  final String compositionName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.image, size: 50),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(compositionName),
                Text(author, style: const TextStyle(fontSize: 12)),
              ],
            ),
            const Expanded(child: SizedBox()),
            const IconButton(onPressed: null, icon: Icon(Icons.speaker)),
            const IconButton(onPressed: null, icon: Icon(Icons.favorite)),
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

class NavigationItemWidget extends StatelessWidget {
  const NavigationItemWidget({
    super.key,
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
