import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_bloc.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_event.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          context
              .read<NavigationBloc>()
              .add(NavigationReturnToTabEvent(tabNumber: 0));
        },
        icon: const Icon(
          Icons.arrow_back,
          size: 30,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Settings',
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
