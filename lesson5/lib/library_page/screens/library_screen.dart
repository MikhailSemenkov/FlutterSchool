import 'package:flutter/material.dart';

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
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopBar(),
              ContentChooseBar(),
              OrderBar(),
              ListViewItem(
                title: 'Liked Songs',
                description: 'playlist - 234 songs',
              ),
              ListViewItem(
                title: 'New Episodes',
                description: 'Updated Mar 6, 2023',
              ),
              ListViewItem(
                title: 'Top of the top songs',
                description: 'playlist - Spotify',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
