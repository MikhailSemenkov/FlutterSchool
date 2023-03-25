import 'package:flutter/material.dart';

import '../widgets/search_list_view_row_widget.dart';
import '../widgets/search_search_bar_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Search', style: TextStyle(fontSize: 25)),
              SearchBar(),
              Text('Browse all', style: TextStyle(fontSize: 16)),
              ListViewRow(
                firstItemColor: Colors.deepOrangeAccent,
                firstItemTitle: 'Podcast',
                secondItemColor: Colors.deepPurple,
                secondItemTitle: 'Live Events',
              ),
              ListViewRow(
                firstItemColor: Colors.indigo,
                firstItemTitle: 'Made for you',
                secondItemColor: Colors.pink,
                secondItemTitle: 'New releases',
              ),
              ListViewRow(
                firstItemColor: Colors.green,
                firstItemTitle: 'Pop',
                secondItemColor: Colors.brown,
                secondItemTitle: 'Hip-Hop',
              ),
              ListViewRow(
                firstItemColor: Colors.red,
                firstItemTitle: 'Rock',
                secondItemColor: Colors.pinkAccent,
                secondItemTitle: 'Mood',
              ),
              ListViewRow(
                firstItemColor: Colors.deepPurpleAccent,
                firstItemTitle: 'Charts',
                secondItemColor: Colors.orange,
                secondItemTitle: 'Dance/Electronic',
              ),
              ListViewRow(
                firstItemColor: Colors.deepOrange,
                firstItemTitle: 'Chill',
                secondItemColor: Colors.redAccent,
                secondItemTitle: 'Indie',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
