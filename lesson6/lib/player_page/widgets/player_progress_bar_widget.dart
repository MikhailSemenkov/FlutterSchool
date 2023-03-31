import 'package:flutter/material.dart';
import 'package:lesson6/player_page/state/player_model.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required Duration duration})
      : _duration = duration,
        super(key: key);

  final Duration _duration;

  String _twoDigits(int n) => n >= 10 ? "$n" : "0$n";

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerModel>(
      builder: (context, model, child) {
        if (model.passedTime > _duration.inSeconds) {
          model.resetTime();
        }
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
                  max: _duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    model.passedTime = value;
                  },
                  value: model.passedTime,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${model.passedTime ~/ 60}:'
                  '${_twoDigits(model.passedTime.toInt() % 60)}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '${_duration.inMinutes}:'
                  '${_twoDigits(_duration.inSeconds.remainder(60))}',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
