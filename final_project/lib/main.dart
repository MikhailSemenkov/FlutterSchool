import 'package:final_project/authorization/bloc/authorization_bloc.dart';
import 'package:final_project/authorization/screens/authorization_screen.dart';
import 'package:final_project/error_screen/screens/error_screen.dart';
import 'package:final_project/home_page/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_screen/screens/loading_screen.dart';
import 'themes/styles/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPaintSizeEnabled = debugPaintBaselinesEnabled = false;
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Cinema',
      theme: Themes.theme,
      home: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            AuthorizationBloc()..add(GetAuthorizationTokenEvent()),
        child: BlocBuilder<AuthorizationBloc, AuthorizationState>(
          builder: (context, state) {
            if (state is AuthorizationFinishedState) {
              return const HomeScreen();
            }
            if (state is AuthorizationNeedUserActionState) {
              return const AuthorizationScreen();
            }
            if (state is AuthorizationLoadingState) {
              return const LoadingScreen();
            }
            return ErrorScreen(
              message: 'Authorization error',
              onPressed: () {
                context.read<AuthorizationBloc>().add(
                      GetAuthorizationTokenEvent(),
                    );
              },
            );
          },
        ),
      ),
    );
  }
}
