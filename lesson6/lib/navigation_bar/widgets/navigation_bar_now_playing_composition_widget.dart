import 'package:flutter/material.dart';
import 'package:lesson6/player_page/state/player_model.dart';
import 'package:provider/provider.dart';

import '../../hero_animation/widgets/hero_composition_cover_widget.dart';
import '../../hero_animation/widgets/hero_text_widget.dart';

class NowPlayingComposition extends StatelessWidget {
  const NowPlayingComposition({
    Key? key,
    required String author,
    required String compositionName,
    required Function onTap,
    required Duration duration,
  })  : _onTap = onTap,
        _compositionName = compositionName,
        _author = author,
        _duration = duration,
        super(key: key);

  final String _author;
  final String _compositionName;
  final Function _onTap;
  final Duration _duration;

  @override
  Widget build(BuildContext context) {
    final updatablePlayerModel =
        Provider.of<PlayerModel>(context, listen: true);

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    _onTap();
                  },
                  child: Row(
                    children: [
                      const SizedBox.square(
                        dimension: 50,
                        child: CompositionCover(
                          image: 'images/bowie_heroes.jpg',
                          tag: 'CompositionCover',
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HeroText(
                            tag: 'CompositionName',
                            text: _compositionName,
                            fontSize: 14,
                            textColor: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          HeroText(
                            tag: 'CompositionAuthor',
                            text: _author,
                            fontSize: 12,
                            textColor: Colors.grey,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                      // const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ),
            ),
            const IconButton(onPressed: null, icon: Icon(Icons.speaker)),
            const IconButton(
                onPressed: null, icon: Icon(Icons.favorite_border)),
            IconButton(
              onPressed: () {
                updatablePlayerModel.playPressed();
              },
              isSelected:
                  Provider.of<PlayerModel>(context, listen: false).isPlaying,
              icon: const Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 30,
              ),
              selectedIcon: const Icon(
                Icons.pause,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        Consumer<PlayerModel>(
          builder: (context, model, child) {
            if (model.passedTime > _duration.inSeconds) {
              model.resetTime();
            }
            return LinearProgressIndicator(
              value: model.passedTime / _duration.inSeconds,
              backgroundColor: Colors.transparent,
              color: Colors.white,
            );
          },
        )
      ],
    );
  }
}
