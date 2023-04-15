import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'authorization/bloc/authorization_bloc.dart';
import 'authorization/screens/authorization_screen.dart';
import 'authorization/screens/redirect_to_authorization_screen.dart';
import 'home_page/screens/home_screen.dart';
import 'library_page/screens/library_screen.dart';
import 'navigation_bar/bloc/navigation_bloc.dart';
import 'navigation_bar/screens/navigation_bar.dart';
import 'player_page/state/player_model.dart';
import 'search_page/screens/search_screen.dart';
import 'splash_screen/screens/splash_screen.dart';
import 'theme/bloc/theme_bloc.dart';
import 'theme/repository/theme_repository.dart';

void main() {
  runApp(BlocProvider(
    create: (context) {
      return ThemeBloc(repository: ThemeRepository())..add(LoadThemeEvent());
    },
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
        if (state is DarkThemeState || state is LightThemeState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Lesson 8',
            theme: state.themeData,
            routes: <String, WidgetBuilder>{
              '/authorization': (context) => const AuthorizationScreen(),
            },
            home: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => NavigationBloc()
                    ..add(
                      NavigationChangeTabWithSwipeEvent(tabNumber: 0),
                    ),
                ),
                BlocProvider(create: (context) {
                  return AuthorizationBloc()..add(GetAuthorizationEvent());
                }),
              ],
              child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
                builder: (context, state) {
                  if (state is AuthorizationErrorState) {
                    return Center(
                      child: Text(
                        "Failed authorization. Try again.",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    );
                  }
                  if (state is AuthorizationNeedUserPermissionState) {
                    return const RedirectToAuthorizationScreen();
                  }
                  if (state is AuthorizationFinishedState) {
                    return ChangeNotifierProvider(
                      create: (context) => PlayerModel(),
                      child: const MyHomePage(),
                    );
                  }
                  return const SplashScreen();
                },
              ),
            ),
          );
        }
        return const SplashScreen();
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
      context
          .read<NavigationBloc>()
          .add(NavigationChangeTabWithSwipeEvent(tabNumber: _controller.index));
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
            builder: (context, state) {
              if (state.isReady) {
                _controller.animateTo(state.tabNumber);
              }
              return _tabs[index];
            },
          ),
        ),
      ),
    );
  }
}
