import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

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
        const Text(
          'Your Library',
          style: TextStyle(fontSize: 25),
        ),
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
