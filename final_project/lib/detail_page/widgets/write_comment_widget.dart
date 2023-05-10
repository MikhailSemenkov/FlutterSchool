import 'package:flutter/material.dart';

import '../../api_client/api_client.dart';

class WriteCommentWidget extends StatefulWidget {
  const WriteCommentWidget(
      {Key? key, required int movieId, required Function onAdd})
      : _onAdd = onAdd,
        _movieId = movieId,
        super(key: key);

  final int _movieId;
  final Function _onAdd;

  @override
  State<WriteCommentWidget> createState() => _WriteCommentWidgetState();
}

class _WriteCommentWidgetState extends State<WriteCommentWidget> {
  String _comment = ' ';
  int _rating = 0;
  bool _isLoading = false;

  _tryAddComment() {
    setState(() {
      _isLoading = true;
    });
    APIClient().addComment(_comment, _rating, widget._movieId).then(
      (value) {
        widget._onAdd();
        Navigator.of(context).pop();
      },
    ).catchError(
      (error) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            content: Text(
                'Error in add comment process. Check your internet connection and try again'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FittedBox(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: AlertDialog(
            backgroundColor: theme.colorScheme.background,
            title: const Text('Change username'),
            content: Column(
              children: [
                Row(
                  children: List.generate(
                    5,
                    (index) => IconButton(
                      splashRadius: 15,
                      onPressed: () {
                        setState(() {
                          _rating = index + 1;
                        });
                      },
                      icon: Icon(
                        Icons.star,
                        color: (_rating > index) ? Colors.amber : Colors.grey,
                      ),
                    ),
                  ),
                ),
                TextField(
                  maxLines: null,
                  autofocus: true,
                  cursorColor: theme.colorScheme.onBackground,
                  style: theme.textTheme.bodyMedium,
                  onChanged: (value) => _comment = value,
                  decoration: InputDecoration(
                    hintText: 'Your comment',
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: theme.colorScheme.onBackground,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              FilledButton(
                onPressed: (_rating != 0) ? _tryAddComment : null,
                child: (_isLoading)
                    ? const CircularProgressIndicator()
                    : const Text('Send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
