import 'package:flutter/material.dart';

class SearchPage {
  List<Widget> getWidget() {
    return <Widget>[
      const Text(
        'Search',
        style: TextStyle(fontSize: 25),
      ),
      _searchBar(),
      const Text(
        'Browse all',
        style: TextStyle(fontSize: 16),
      ),
      _listViewRow(
          Colors.deepOrangeAccent, 'Podcast', Colors.deepPurple, 'Live Events'),
      _listViewRow(Colors.indigo, 'Made for you', Colors.pink, 'New releases'),
      _listViewRow(Colors.green, 'Pop', Colors.brown, 'Hip-Hop'),
      _listViewRow(Colors.red, 'Rock', Colors.pinkAccent, 'Mood'),
      _listViewRow(
          Colors.deepPurpleAccent, 'Charts', Colors.orange, 'Dance/Electronic'),
      _listViewRow(Colors.deepOrange, 'Chill', Colors.redAccent, 'Indie'),
    ];
  }

  Widget _searchBar() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 10),
      height: 50,
      child: FilledButton(
        onPressed: null,
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
          disabledBackgroundColor: Colors.white,
          padding: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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
      ),
    );
  }

  Widget _listViewRow(Color firstItemColor, String firstItemTitle,
      Color secondItemColor, String secondItemTitle) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: _listViewItem(firstItemColor, firstItemTitle),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 7,
          child: _listViewItem(secondItemColor, secondItemTitle),
        ),
      ],
    );
  }

  Widget _listViewItem(Color backgroundColor, String title) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: FilledButton(
        onPressed: null,
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: backgroundColor,
          disabledBackgroundColor: backgroundColor,
          disabledForegroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 0),
          alignment: Alignment.topLeft,
        ),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
