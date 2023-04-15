import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../hero_animation/screens/hero_animation.dart';
import '../bloc/navigation_bloc.dart';
import '../widgets/navigation_bar_item_widget.dart';

class MyNavigationBar extends StatelessWidget {
  const MyNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary,
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          stops: const [0, 0.6, 1],
        ),
      ),
      height: 140,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const HeroAnimation(),
          BlocBuilder<NavigationBloc, NavigationState>(
            builder: (context, state) => NavigationBar(
              onDestinationSelected: (int index) {
                context
                    .read<NavigationBloc>()
                    .add(NavigationChangeTabWithTapEvent(tabNumber: index));
              },
              selectedIndex: state.tabNumber,
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
          ),
        ],
      ),
    );
  }
}
