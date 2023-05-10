import 'package:flutter/material.dart';

import '../../api_client/api_client.dart';
import '../../data/comments.dart';
import 'rating_indicator_widget.dart';

class CommentsListTileWidget extends StatelessWidget {
  const CommentsListTileWidget(
      {Key? key,
      required Comment comment,
      required Function reloadWidgetData,
      required BuildContext context})
      : _context = context,
        _reloadWidgetData = reloadWidgetData,
        _comment = comment,
        super(key: key);

  final Comment _comment;
  final Function _reloadWidgetData;
  final BuildContext _context;

  _deleteComment() async {
    try {
      await APIClient().removeComment(_comment.id!);
      _reloadWidgetData();
    } catch (e) {
      ScaffoldMessenger.of(_context).showSnackBar(
        const SnackBar(
          content: Text('Error while comment deleting. Try again.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: ListTile(
        tileColor: theme.colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Row(
          children: [
            Text((_comment.author != null)
                ? '${_comment.author} '
                : 'User${_comment.id} '),
            SizedBox(
              height: 15,
              child: RatingIndicatorWidget(rating: _comment.rating!.toDouble()),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          child: Text(_comment.content ?? ''),
        ),
        trailing: (_comment.isMy!)
            ? IconButton(
                onPressed: () {
                  _deleteComment();
                },
                icon: Icon(
                  Icons.delete_forever,
                  color: theme.colorScheme.secondary,
                ),
              )
            : null,
      ),
    );
  }
}
