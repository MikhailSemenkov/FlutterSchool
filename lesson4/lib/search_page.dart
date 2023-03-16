import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}

class ListViewRow extends StatelessWidget {
  const ListViewRow({
    super.key,
    required this.firstItemColor,
    required this.firstItemTitle,
    required this.secondItemColor,
    required this.secondItemTitle,
  });

  final Color firstItemColor;
  final String firstItemTitle;
  final Color secondItemColor;
  final String secondItemTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 7,
          child: ListViewItem(
              backgroundColor: firstItemColor, title: firstItemTitle),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 7,
          child: ListViewItem(
              backgroundColor: secondItemColor, title: secondItemTitle),
        ),
      ],
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.backgroundColor,
    required this.title,
  });

  final Color backgroundColor;
  final String title;

  @override
  Widget build(BuildContext context) {
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
