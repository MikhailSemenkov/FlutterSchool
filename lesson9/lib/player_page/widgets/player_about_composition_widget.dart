import 'package:flutter/material.dart';
import 'package:lesson9/player_page/widgets/favorite_button_widget.dart';

import '../../hero_animation/widgets/hero_text_widget.dart';

class AboutCompositionBar extends StatelessWidget {
  const AboutCompositionBar(
      {Key? key, required String compositionName, required String author})
      : _author = author,
        _compositionName = compositionName,
        super(key: key);

  final String _compositionName;
  final String _author;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroText(
                tag: 'CompositionName',
                text: _compositionName,
                textStyle: Theme.of(context).textTheme.displayLarge,
              ),
              HeroText(
                tag: 'CompositionAuthor',
                text: _author,
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          const FavoriteButton(),
        ],
      ),
    );
  }
}
