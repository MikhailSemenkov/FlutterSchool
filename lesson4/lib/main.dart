import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lesson4/home_page.dart';
import 'package:lesson4/library_page.dart';
import 'package:lesson4/navigation_bar.dart';
import 'package:lesson4/search_page.dart';
import 'package:lesson4/settings_menu.dart';

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  late List<Widget> _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = [const HomePage(), const SearchPage(), const LibraryPage()];
    _controller = TabController(length: _tabs.length, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      endDrawer: const SettingsDrawer(),
      bottomNavigationBar: MyNavigationBar(
        changeTab: (int pageNumber) {
          setState(() {
            _controller.animateTo(pageNumber);
          });
        },
        pageCounter: _controller.index,
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabs,
      ),
    );
  }
}
