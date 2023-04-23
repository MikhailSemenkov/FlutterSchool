import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../state/player_model.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> _animation;
  late Animation<double?> _circle1Animation;
  late Animation<double?> _circle2Animation;
  late Animation<double?> _shakeAnimation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = ColorTween(
      begin: Colors.white,
      end: Colors.green,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _circle1Animation = Tween<double>(
      begin: 0,
      end: 40,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutExpo));
    _circle2Animation = Tween<double>(
      begin: 0,
      end: 40,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _shakeAnimation = CurvedAnimation(parent: _controller, curve: ShakeCurve());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerModel>(
      builder: (context, player, child) {
        return IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            player.favoritePressed();
            if (player.isFavorite) {
              _controller.value = 0;
              _controller.forward();
            } else {
              _controller.value = 1;
              _controller.reverse();
            }
          },
          highlightColor: Colors.transparent,
          icon: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: _circle1Animation.value,
                height: _circle1Animation.value,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: (player.isFavorite && _controller.value != 1)
                          ? Colors.green
                          : Colors.transparent),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: _circle2Animation.value,
                height: _circle2Animation.value,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: (player.isFavorite && _controller.value != 1)
                          ? Colors.green
                          : Colors.transparent),
                  shape: BoxShape.circle,
                ),
              ),
              Transform.rotate(
                alignment: Alignment.bottomCenter,
                angle: (!player.isFavorite && _controller.value != 1)
                    ? _shakeAnimation.value! * 10 * pi / 180
                    : 0,
                child: Icon(
                  (_controller.value >= 0.35 ||
                          player.isFavorite && _controller.value == 0)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: (player.isFavorite) ? Colors.green : _animation.value,
                  size: (player.isFavorite && _controller.value != 1)
                      ? 25 + _shakeAnimation.value! * 5
                      : 25,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ShakeCurve extends Curve {
  @override
  double transform(double t) => sin(t * pi * 4);
}
