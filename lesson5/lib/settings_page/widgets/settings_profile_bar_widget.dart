import 'package:flutter/material.dart';

class ProfileBar extends StatelessWidget {
  const ProfileBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.tealAccent,
              ),
            ),
            const Text(
              'U',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
          ],
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'User',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'View Profile',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        const Expanded(child: SizedBox()),
        IconButton(
          highlightColor: Colors.grey,
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_forward_ios,
            size: 10,
          ),
        ),
      ],
    );
  }
}
