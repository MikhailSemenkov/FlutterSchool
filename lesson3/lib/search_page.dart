import 'package:flutter/material.dart';

class SearchPage {
  Widget getWidget() {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Search',
                style: TextStyle(fontSize: 25),
              ),
              _searchBar(),
              const Text(
                'Browse all',
                style: TextStyle(fontSize: 16),
              ),
              _listViewRow(Colors.deepOrangeAccent, 'Podcast',
                  Colors.deepPurple, 'Live Events'),
              _listViewRow(
                  Colors.indigo, 'Made for you', Colors.pink, 'New releases'),
              _listViewRow(Colors.green, 'Pop', Colors.brown, 'Hip-Hop'),
              _listViewRow(Colors.red, 'Rock', Colors.pinkAccent, 'Mood'),
              _listViewRow(Colors.deepPurpleAccent, 'Charts', Colors.orange,
                  'Dance/Electronic'),
              _listViewRow(
                  Colors.deepOrange, 'Chill', Colors.redAccent, 'Indie'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, size: 30, color: Colors.black),
          SizedBox(
            width: 10,
          ),
          Text('What do you want to listen to?',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _listViewRow(Color firstItemColor, String firstItemTitle,
      Color secondItemColor, String secondItemTitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _listViewItem(firstItemColor, firstItemTitle),
        _listViewItem(secondItemColor, secondItemTitle),
      ],
    );
  }

  Widget _listViewItem(Color backgroundColor, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: 180,
      height: 100,
      color: backgroundColor,
      child: Container(
        width: 80,
        height: 100,
        padding: const EdgeInsets.all(10),
        child: Text(
          title,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
