import 'package:flutter/material.dart';

import 'library_outlined_button_widget.dart';

class ContentChooseBar extends StatelessWidget {
  const ContentChooseBar({super.key});

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
