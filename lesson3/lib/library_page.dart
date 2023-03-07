import 'package:flutter/material.dart';

class LibraryPage {
  Widget getWidget() {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _topBar(),
              _contentChooseBar(),
              _orderBar(),
              _listViewItem('Liked Songs', 'playlist - 234 songs'),
              _listViewItem('New Episodes', 'Updated Mar 6, 2023'),
              _listViewItem('Top of the top songs', 'playlist - Spotify'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _listViewItem(String title, String description) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(description,
          style: const TextStyle(color: Colors.grey, fontSize: 12)),
      leading: const Icon(Icons.image, size: 60),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.tealAccent),
            ),
            const Text('U',
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ],
        ),
        const SizedBox(width: 10),
        const Text('Your Library', style: TextStyle(fontSize: 25)),
        const Expanded(child: SizedBox()),
        const Row(
          children: [
            IconButton(
                onPressed: null,
                icon: Icon(Icons.search, size: 30, color: Colors.white)),
            IconButton(
                onPressed: null,
                icon: Icon(Icons.add, size: 30, color: Colors.white)),
          ],
        )
      ],
    );
  }

  Widget _contentChooseBar() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: null,
            child: const Text(
              'Playlist',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 10),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: null,
            child: const Text(
              'Podcasts & Shows',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
          const SizedBox(width: 10),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Colors.grey,
            ),
            onPressed: null,
            child: const Text(
              'Albums',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _orderBar() {
    return const Row(
      children: [
        Icon(Icons.swap_vert),
        SizedBox(width: 10),
        Text('Recents'),
        Expanded(child: SizedBox()),
        IconButton(
            onPressed: null, icon: Icon(Icons.grid_view, color: Colors.white)),
      ],
    );
  }
}
