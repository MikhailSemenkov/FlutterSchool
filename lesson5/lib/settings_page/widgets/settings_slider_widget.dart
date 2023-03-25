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
        const Text('Off'),
        SliderTheme(
          data: const SliderThemeData(
            showValueIndicator: ShowValueIndicator.always,
          ),
          child: Expanded(
            child: Slider(
              min: 0,
              max: 12,
              activeColor: Colors.green,
              inactiveColor: Colors.grey,
              thumbColor: Colors.green,
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
        const Text('12 s'),
      ],
    );
  }
}
