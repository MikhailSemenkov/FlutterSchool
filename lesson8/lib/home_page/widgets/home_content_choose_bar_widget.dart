import 'package:flutter/material.dart';

import 'home_filled_button_widget.dart';

class ContentChooseBar extends StatelessWidget {
  const ContentChooseBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        children: [
          MyFilledButton(title: 'Music'),
          SizedBox(
            width: 20,
          ),
          MyFilledButton(title: 'Podcasts & Shows'),
        ],
      ),
    );
  }
}
