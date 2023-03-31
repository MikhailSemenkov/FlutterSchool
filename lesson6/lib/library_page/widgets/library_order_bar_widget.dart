import 'package:flutter/material.dart';

class OrderBar extends StatelessWidget {
  const OrderBar({super.key});

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
