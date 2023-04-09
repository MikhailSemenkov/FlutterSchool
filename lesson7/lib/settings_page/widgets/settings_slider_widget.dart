import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  int _sliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Off',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        SliderTheme(
          data: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
          ),
          child: Expanded(
            child: Slider(
              min: 0,
              max: 12,
              activeColor: Theme.of(context).primaryColor,
              inactiveColor: Theme.of(context).primaryColor,
              thumbColor: Theme.of(context).primaryColor,
              value: _sliderValue.toDouble(),
              label: _sliderValue.toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value.toInt();
                });
              },
            ),
          ),
        ),
        Text(
          '12 s',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
