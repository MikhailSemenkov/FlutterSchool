import 'package:flutter/material.dart';

import 'search_list_view_item_widget.dart';

class ListViewRow extends StatelessWidget {
  const ListViewRow({
    super.key,
    required Color firstItemColor,
    required String firstItemTitle,
    required Color secondItemColor,
    required String secondItemTitle,
  })  : _secondItemTitle = secondItemTitle,
        _secondItemColor = secondItemColor,
        _firstItemTitle = firstItemTitle,
        _firstItemColor = firstItemColor;

  final Color _firstItemColor;
  final String _firstItemTitle;
  final Color _secondItemColor;
  final String _secondItemTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 7,
          child: ListViewItem(
              backgroundColor: _firstItemColor, title: _firstItemTitle),
        ),
        const Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 7,
          child: ListViewItem(
              backgroundColor: _secondItemColor, title: _secondItemTitle),
        ),
      ],
    );
  }
}
