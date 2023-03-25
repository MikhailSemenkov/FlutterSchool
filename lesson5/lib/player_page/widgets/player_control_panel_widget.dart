import 'package:flutter/material.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key, required Function playOnPressed})
      : _playOnPressed = playOnPressed,
        super(key: key);

  final Function _playOnPressed;

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shuffle,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_previous,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget._playOnPressed();
              _isPlaying = !_isPlaying;
            });
          },
          isSelected: _isPlaying,
          icon: const Icon(
            Icons.play_circle_fill,
            size: 80,
            color: Colors.white,
          ),
          selectedIcon: const Icon(
            Icons.pause_circle_filled,
            size: 80,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.skip_next,
            size: 40,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.repeat,
            size: 30,
          ),
        ),
      ],
    );
  }
}
