import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar(
      {Key? key, required bool isPlaying, required Duration duration})
      : _isPlaying = isPlaying,
        _duration = duration,
        super(key: key);

  final bool _isPlaying;
  final Duration _duration;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  final prefs = SharedPreferences.getInstance();
  double _passedTime = 0;
  late Timer _timer;

  @override
  void didUpdateWidget(ProgressBar oldWidget) {
    if (widget._isPlaying) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _passedTime++;
          if (_passedTime > widget._duration.inSeconds) {
            _passedTime = 0;
          }
        });
      });
    } else {
      _timer.cancel();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _twoDigits(int n) => n >= 10 ? "$n" : "0$n";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SliderTheme(
            data: SliderThemeData(
              trackHeight: 3,
              trackShape: const RectangularSliderTrackShape(),
              thumbShape: const RoundSliderThumbShape(
                enabledThumbRadius: 5,
              ),
              overlayShape: SliderComponentShape.noOverlay,
            ),
            child: Slider(
              activeColor: Colors.white,
              inactiveColor: const Color(0x55777777),
              min: 0,
              max: widget._duration.inSeconds.toDouble(),
              onChanged: (value) {
                setState(() {
                  _passedTime = value;
                });
              },
              value: _passedTime,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${_passedTime ~/ 60}:'
              '${_twoDigits(_passedTime.toInt() % 60)}',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            Text(
              '${widget._duration.inMinutes}:'
              '${_twoDigits(widget._duration.inSeconds.remainder(60))}',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        )
      ],
    );
  }
}
