import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.speaker),
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.share_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
