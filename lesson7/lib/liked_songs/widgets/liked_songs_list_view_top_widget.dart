import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../theme/bloc/theme_bloc.dart';
import 'liked_songs_about_playlist_widget.dart';
import 'liked_songs_playlist_control_widget.dart';

class ListViewTop extends StatelessWidget {
  const ListViewTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: context.read<ThemeBloc>().state.isDark
            ? [
                Colors.indigo.withOpacity(0.7),
                Colors.indigo.withOpacity(0.45),
                Theme.of(context).scaffoldBackgroundColor,
              ]
            : [
                Colors.green.withOpacity(0.7),
                Colors.green.withOpacity(0.45),
                Theme.of(context).scaffoldBackgroundColor,
              ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: const [0, 0.35, 1],
      )),
      padding: const EdgeInsets.all(20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AboutPlaylist(),
          PlaylistControl(),
        ],
      ),
    );
  }
}
