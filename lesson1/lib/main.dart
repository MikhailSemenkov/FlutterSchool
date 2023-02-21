import 'package:flutter/material.dart';
import 'package:lesson1/profile.dart';

/// Start point of program,
/// here setups widget tree root.
void main() {
  runApp(const MyApp());
}

/// Widget which is the root of this application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Application root setup.
  ///
  /// Here are choosing theme and main page
  /// of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter lesson 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter School First Lesson'),
    );
  }
}

/// This widget is the home page of application.
/// It has a State object (defined below) that contains
/// fields that affect how page looks.
class MyHomePage extends StatefulWidget {

  /// Initialize [key] (optional) and [title] (required).
  const MyHomePage({super.key, required this.title});

  /// Title of current page.
  final String title;

  /// Creates the mutable state for this widget
  /// at a given location in the tree.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// Description of how looks and work
/// main page of application
class _MyHomePageState extends State<MyHomePage> {
  /// Counter for reading from [_profiles]
  int _counter = 0;

  /// List of profiles which can be showed on page
  final List<Profile> _profiles = [];

  /// Profile which is showing right now
  List<String> _currentProfile = [];

  /// Constructor which initialize [_profiles] list
  /// and sets [_currentProfile] to show it on page.
  _MyHomePageState() {
    _profiles.add(Profile(location: 'Kyiv'));
    _profiles.add(Profile());
    _profiles.add(Profile(
        firstName: 'David', lastName: 'Bowie', age: 34, location: 'London'));
    _profiles.add(Profile(firstName: 'Mykhailo'));

    _currentProfile = _profiles[_counter].toList();
  }

  /// Add one to [_counter] to show next profile from [_profiles]
  void _incrementCounter() {
    // This tells to Flutter that something has changed
    // and page should build again.
    setState(() {
      // Cycled counter allows not use if.
      _counter = ++_counter % _profiles.length;

      _currentProfile = _profiles[_counter].toList();
    });
  }

  /// This method is rerun every time setState is called,
  /// by the _incrementCounter method above.
  ///
  /// Every rerun on page shows new profile from [_profiles]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Set appbar background color.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Set appbar title.
        title: Text(widget.title),
      ),
      // Position child in the middle of the screen.
      body: Center(
        // Arrange children vertically.
        child: Column(
          // Center children vertically.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Put icon on top of widget.
            const Icon(
              Icons.person,
              size: 200,
            ),
            // Put profile information under icon
            Text(
              '${_currentProfile[0]} \n${_currentProfile[1]} \n'
              '${_currentProfile[2]} \n${_currentProfile[3]}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // Button which change [_currentProfile] and
      // leads to a redraw
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Next profile',
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}
