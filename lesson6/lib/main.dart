import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lesson6/home_page/screens/home_screen.dart';
import 'package:lesson6/library_page/screens/library_screen.dart';
import 'package:lesson6/navigation_bar/screens/navigation_bar.dart';
import 'package:lesson6/player_page/state/player_model.dart';
import 'package:lesson6/search_page/screens/search_screen.dart';
import 'package:provider/provider.dart';

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
      title: 'Lesson 6',
      theme: ThemeData(
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (context) => PlayerModel(),
        child: const MyHomePage(),
      ),
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

  liftUpTabChange(int pageNumber) {
    setState(() {
      _controller.animateTo(pageNumber);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabs = [
      HomeScreen(
        changeTab: liftUpTabChange,
      ),
      const SearchScreen(),
      const LibraryScreen()
    ];
    _controller = TabController(length: _tabs.length, vsync: this);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: MyNavigationBar(
        changeTab: liftUpTabChange,
        pageNumber: _controller.index,
      ),
      body: TabBarView(
        controller: _controller,
        children: _tabs,
      ),
    );
  }
}
