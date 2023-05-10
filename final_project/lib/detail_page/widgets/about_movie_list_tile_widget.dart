import 'package:flutter/material.dart';

class AboutMovieListTileWidget extends StatelessWidget {
  const AboutMovieListTileWidget(
      {Key? key,
      required String title,
      required String body,
      required bool withDivider})
      : _withDivider = withDivider,
        _body = body,
        _title = title,
        super(key: key);

  final String _title;
  final String _body;
  final bool _withDivider;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            _title,
            style: theme.textTheme.titleMedium,
          ),
        ),
        Text(
          _body,
          style: theme.textTheme.bodySmall,
        ),
        (_withDivider)
            ? const Divider(
                color: Colors.grey,
              )
            : const SizedBox(),
      ],
    );
  }
}
