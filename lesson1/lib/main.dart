import 'package:flutter/material.dart';
import 'package:lesson1/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lesson 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter School First Lesson'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _profileCounter = 0;

  final List<Profile> _profiles = [];

  List<String> _currentProfile = [];

  @override
  void initState() {
    super.initState();
    _profiles.add(Profile(location: 'Kyiv'));
    _profiles.add(Profile());
    _profiles.add(Profile(
        firstName: 'David', lastName: 'Bowie', age: 34, location: 'London'));
    _profiles.add(Profile(firstName: 'Mykhail'));

    _currentProfile = _profiles[_profileCounter].toList();
  }

  void _incrementProfileCounter() {
    setState(() {
      _profileCounter = ++_profileCounter % _profiles.length;

      _currentProfile = _profiles[_profileCounter].toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.person,
              size: 200,
            ),
            Text(
              '${_currentProfile[0]} \n${_currentProfile[1]} \n'
              '${_currentProfile[2]} \n${_currentProfile[3]}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementProfileCounter,
        tooltip: 'Next profile',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
