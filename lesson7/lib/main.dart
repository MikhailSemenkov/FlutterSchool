import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson7/home_page/screens/home_screen.dart';
import 'package:lesson7/library_page/screens/library_screen.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_bloc.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_event.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_state.dart';
import 'package:lesson7/navigation_bar/screens/navigation_bar.dart';
import 'package:lesson7/player_page/state/player_model.dart';
import 'package:lesson7/search_page/screens/search_screen.dart';
import 'package:lesson7/theme/bloc/theme_bloc.dart';
import 'package:lesson7/theme/repository/theme_repository.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(BlocProvider(
    create: (context) =>
        ThemeBloc(repository: ThemeRepository())..add(LoadThemeEvent()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = debugPaintBaselinesEnabled = false;
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        if (state is LoadingThemeState) {
          return MaterialApp(
            home: Scaffold(
              backgroundColor: Colors.black,
              body: Center(
                child: SizedBox.square(
                  dimension: 300,
                  child: Image.asset(
                    'images/logo.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Lesson 6',
          theme: state.themeData,
          home: BlocProvider(
            create: (context) => NavigationBloc()
              ..add(NavigationChangeTabWithSwipeEvent(tabNumber: 0)),
            child: ChangeNotifierProvider(
              create: (context) => PlayerModel(),
              child: const MyHomePage(),
            ),
          ),
        );
      },
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
    _tabs = [
      const HomeScreen(),
      const SearchScreen(),
      const LibraryScreen(),
    ];
    _controller = TabController(length: _tabs.length, vsync: this);
    _controller.addListener(() {
      if (!_controller.indexIsChanging) {
        context.read<NavigationBloc>().add(
            NavigationChangeTabWithSwipeEvent(tabNumber: _controller.index));
      }
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
      bottomNavigationBar: const MyNavigationBar(),
      body: TabBarView(
        controller: _controller,
        children: List.generate(
          3,
          (index) => BlocBuilder<NavigationBloc, NavigationState>(
            buildWhen: (previousState, state) {
              return state.isReady ||
                  state.isLoading ||
                  state.isFinished ||
                  state.isFailed;
            },
            builder: (context, state) {
              if (state.isReady && state.tabNumber != _controller.index) {
                _controller.animateTo(state.tabNumber);
                return _tabs[index];
              }
              if (_controller.index == state.tabNumber &&
                  (_controller.animation!.value != _controller.index ||
                      state.isLoading)) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                );
              }
              if (state.isFailed) {
                return const Center(
                  child: Text(
                    "Failed to load this Page. Check your internet connection.",
                  ),
                );
              }
              return _tabs[index];
            },
          ),
        ),
      ),
    );
  }
}
