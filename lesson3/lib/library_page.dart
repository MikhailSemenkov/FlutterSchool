import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
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
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            const Text(
              'U',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(width: 10),
        const Text('Your Library', style: TextStyle(fontSize: 25)),
        const Expanded(child: SizedBox()),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.search, size: 30, color: Colors.white),
        ),
        const IconButton(
          onPressed: null,
          icon: Icon(Icons.add, size: 30, color: Colors.white),
        )
      ],
    );
  }
}

class ContentChooseBar extends StatelessWidget {
  const ContentChooseBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        children: [
          MyOutlinedButton(title: 'Playlist'),
          SizedBox(width: 10),
          MyOutlinedButton(title: 'Podcasts & Shows'),
          SizedBox(width: 10),
          MyOutlinedButton(title: 'Albums'),
        ],
      ),
    );
  }
}

class MyOutlinedButton extends StatelessWidget {
  const MyOutlinedButton({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
      ),
      onPressed: null,
      child: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}

class OrderBar extends StatelessWidget {
  const OrderBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: null,
          style: TextButton.styleFrom(disabledForegroundColor: Colors.white),
          child: const Row(
            children: [
              Icon(Icons.swap_vert),
              SizedBox(width: 10),
              Text('Recents'),
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        const IconButton(
            onPressed: null, icon: Icon(Icons.grid_view, color: Colors.white)),
      ],
    );
  }
}

class ListViewItem extends StatelessWidget {
  const ListViewItem({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: null,
      title: Text(title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      subtitle: Text(description,
          style: const TextStyle(color: Colors.grey, fontSize: 12)),
      leading: const Icon(Icons.image, size: 60),
    );
  }
}
