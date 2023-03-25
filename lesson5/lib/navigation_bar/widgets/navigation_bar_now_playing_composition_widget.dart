import 'package:flutter/material.dart';

import '../../hero_animation/widgets/hero_composition_cover_widget.dart';
import '../../hero_animation/widgets/hero_text_widget.dart';

class NowPlayingComposition extends StatelessWidget {
  const NowPlayingComposition({
    Key? key,
    required String author,
    required String compositionName,
    required Function onTap,
  })  : _onTap = onTap,
        _compositionName = compositionName,
        _author = author,
        super(key: key);

  final String _author;
  final String _compositionName;
  final Function _onTap;

  @override
  Widget build(BuildContext context) {
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
            const IconButton(onPressed: null, icon: Icon(Icons.play_arrow)),
          ],
        ),
        const LinearProgressIndicator(
          value: 0.75,
          backgroundColor: Colors.transparent,
          color: Colors.white,
        )
      ],
    );
  }
}
