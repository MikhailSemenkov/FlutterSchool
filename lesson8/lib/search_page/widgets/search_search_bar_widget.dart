import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 40, 0, 10),
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: (Theme.of(context).brightness == Brightness.light)
                ? Colors.grey.shade400
                : Colors.transparent,
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 7),
          ),
        ],
      ),
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
            Text(
              'What do you want to listen to?',
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
