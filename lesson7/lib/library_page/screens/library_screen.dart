import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson7/liked_songs/screens/liked_songs_screen.dart';
import 'package:provider/provider.dart';

import '../../navigation_bar/bloc/navigation_bloc.dart';
import '../../player_page/state/player_model.dart';
import '../widgets/library_content_choose_bar_widget.dart';
import '../widgets/library_list_view_item_widget.dart';
import '../widgets/library_order_bar_widget.dart';
import '../widgets/library_top_bar_widget.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const TopBar(),
              const ContentChooseBar(),
              const OrderBar(),
              Builder(
                builder: (context) {
                  final playerModel =
                      Provider.of<PlayerModel>(context, listen: false);
                  final navigationBloc = Provider.of<NavigationBloc>(context);
                  return ListTile(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: navigationBloc,
                          child: ChangeNotifierProvider.value(
                            value: playerModel,
                            child: const LikedSongsScreen(),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'Liked Songs',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    subtitle: Text(
                      'playlist - 10 songs',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    leading: const Icon(
                      Icons.image,
                      size: 60,
                    ),
                  );
                },
              ),
              ListViewItem(
                title: 'New Episodes',
                description: 'Updated Mar 6, 2023',
                onTap: () {},
              ),
              ListViewItem(
                title: 'Top of the top songs',
                description: 'playlist - Spotify',
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
