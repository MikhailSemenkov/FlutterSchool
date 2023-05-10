import 'package:final_project/pong/screens/pong_screen.dart';
import 'package:flutter/material.dart';

class ScreenWidget extends StatefulWidget {
  const ScreenWidget(
      {Key? key, required double margin, required double screenHeight})
      : _screenHeight = screenHeight,
        _margin = margin,
        super(key: key);

  final double _margin;
  final double _screenHeight;

  @override
  State<ScreenWidget> createState() => _ScreenWidgetState();
}

class _ScreenWidgetState extends State<ScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(seconds: 1),
            reverseTransitionDuration: const Duration(seconds: 1),
            pageBuilder: (context, animation, secondaryAnimation) {
              final curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: Curves.easeInQuart,
              );
              Size size = MediaQuery.of(context).size;
              return FadeTransition(
                opacity: curvedAnimation,
                child: PongScreen(
                  size: Size(size.width, size.height - 300),
                ),
              );
            },
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'Pong paddle',
            child: Container(
              margin: EdgeInsets.all(widget._margin),
              height: widget._screenHeight,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            'Screen',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
