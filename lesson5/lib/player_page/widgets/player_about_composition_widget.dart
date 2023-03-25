import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeroText(
                tag: 'CompositionName',
                text: _compositionName,
                fontSize: 20,
                textColor: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              HeroText(
                tag: 'CompositionAuthor',
                text: _author,
                fontSize: 16,
                textColor: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
    );
  }
}
