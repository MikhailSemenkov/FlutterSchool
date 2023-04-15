import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/player_model.dart';

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
                  thumbColor: Theme.of(context).sliderTheme.thumbColor,
                  activeTrackColor:
                      Theme.of(context).sliderTheme.activeTrackColor,
                  inactiveTrackColor:
                      Theme.of(context).sliderTheme.inactiveTrackColor,
                  trackHeight: 3,
                  trackShape: const RectangularSliderTrackShape(),
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 5,
                  ),
                  overlayShape: SliderComponentShape.noOverlay,
                ),
                child: Slider(
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '${_duration.inMinutes}:'
                  '${_twoDigits(_duration.inSeconds.remainder(60))}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
