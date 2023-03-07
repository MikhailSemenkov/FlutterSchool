import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lesson3/home_page.dart';
import 'package:lesson3/library_page.dart';
import 'package:lesson3/search_page.dart';

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

  late HomePage homePage;
  late SearchPage searchPage;
  late LibraryPage libraryPage;

  @override
  void initState() {
    super.initState();
    homePage = HomePage();
    searchPage = SearchPage();
    libraryPage = LibraryPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            _nowPlayingComposition('David Bowie', 'Heroes'),
            _myNavigationBar(),
          ],
        ),
      ),
      body: _getPage(_pageCounter),
    );
  }

  Widget _getPage(int pageCounter) {
    switch (pageCounter) {
      case 0:
        {
          return homePage.getWidget();
        }
      case 1:
        {
          return searchPage.getWidget();
        }
      case 2:
        {
          return libraryPage.getWidget();
        }
      default:
        throw 'Incorrect page number';
    }
  }

  Widget _myNavigationBar() {
    return NavigationBar(
      backgroundColor: Colors.black,
      indicatorColor: Colors.transparent,
      onDestinationSelected: (int index) {
        setState(() {
          _pageCounter = index;
        });
      },
      selectedIndex: _pageCounter,
      destinations: <Widget>[
        _myNavigationDestination(Icons.home, Icons.home_outlined, 'Home'),
        _myNavigationDestination(
            Icons.saved_search_rounded, Icons.search, 'Search'),
        _myNavigationDestination(
            Icons.bookmark, Icons.bookmark_border, 'Your Library'),
      ],
    );
  }

  Widget _myNavigationDestination(
      IconData selectedIcon, IconData icon, String label) {
    return NavigationDestination(
      selectedIcon: Icon(selectedIcon, color: Colors.white),
      icon: Icon(icon, color: Colors.grey),
      label: label,
    );
  }

  Widget _nowPlayingComposition(String author, String compositionName) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.image,
              size: 50,
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(compositionName),
                Text(
                  author,
                  style: const TextStyle(fontSize: 12),
                ),
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
