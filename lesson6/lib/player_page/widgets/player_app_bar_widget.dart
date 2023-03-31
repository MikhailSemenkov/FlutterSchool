import 'package:flutter/material.dart';

class PlayerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PlayerAppBar({Key? key, required playingFrom, required playlistName})
      : _playingFrom = playingFrom,
        _playlistName = playingFrom,
        super(key: key);

  final String _playingFrom;
  final String _playlistName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.expand_more,
          size: 40,
        ),
      ),
      centerTitle: true,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'PLAYING FROM $_playingFrom',
            style: const TextStyle(fontSize: 10),
          ),
          Text(
            _playlistName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            size: 25,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
