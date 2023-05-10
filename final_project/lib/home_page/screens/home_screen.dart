import 'package:final_project/error_screen/screens/error_screen.dart';
import 'package:final_project/loading_screen/screens/loading_screen.dart';
import 'package:final_project/user_profile/screens/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_query_bloc.dart';
import '../widgets/home_appbar_widget.dart';
import '../widgets/movie_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _viewportFraction = 0.75;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: _viewportFraction);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchQueryBloc()
        ..add(
          SendSearchRequestEvent(searchDate: DateTime.now()),
        ),
      child: Scaffold(
        appBar: const HomeAppbarWidget(),
        drawerEdgeDragWidth: 80,
        drawer: const UserProfileScreen(),
        body: BlocBuilder<SearchQueryBloc, SearchQueryState>(
          builder: (context, state) {
            if (state is SearchQueryFinishedState) {
              if (state.movie!.data!.isNotEmpty) {
                return Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _pageController,
                        itemCount: state.movie!.data!.length,
                        itemBuilder: (context, index) {
                          final movie = state.movie!.data![index];
                          return AnimatedBuilder(
                            animation: _pageController,
                            child: MovieWidget(
                              movie: movie,
                              viewportFraction: _viewportFraction,
                            ),
                            builder: (context, child) {
                              double value;
                              if (_pageController.position.haveDimensions) {
                                value = _pageController.page! - index;
                                value = (1 - value.abs())
                                    .clamp(_viewportFraction, 1);
                              } else {
                                if (index == 0) {
                                  value = 1;
                                } else {
                                  value = _viewportFraction;
                                }
                              }
                              return Transform.scale(
                                scale: Curves.easeInOut.transform(value),
                                child: child,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Nothing found')],
                ),
              );
            }
            if (state is SearchQueryErrorState) {
              return ErrorScreen(
                onPressed: () {
                  context.read<SearchQueryBloc>().add(
                        SendSearchRequestEvent(
                          searchDate: DateTime.now(),
                        ),
                      );
                },
                message: 'Can not load this page',
              );
            }
            return const LoadingScreen();
          },
        ),
      ),
    );
  }
}
