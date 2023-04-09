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
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Text(
          'Your Library',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, size: 30),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add, size: 30),
        )
      ],
    );
  }
}
