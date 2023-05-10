import 'package:flutter/material.dart';

import '../../api_client/api_client.dart';

class ChangeUsernameWidget extends StatefulWidget {
  const ChangeUsernameWidget({Key? key, required Function onSave})
      : _onSave = onSave,
        super(key: key);

  final Function _onSave;

  @override
  State<ChangeUsernameWidget> createState() => _ChangeUsernameWidgetState();
}

class _ChangeUsernameWidgetState extends State<ChangeUsernameWidget> {
  String _newUsername = '';
  bool _isLoading = false;

  _tryToChange() {
    setState(() {
      _isLoading = true;
    });
    APIClient().updateUserName(_newUsername).then(
      (value) {
        widget._onSave();
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
                'Error in change name process. Check your internet connection and try again'),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AlertDialog(
        backgroundColor: theme.colorScheme.background,
        title: const Text('Change username'),
        content: TextField(
          autofocus: true,
          cursorColor: theme.colorScheme.onBackground,
          style: theme.textTheme.bodyMedium,
          onChanged: (value) => _newUsername = value,
          decoration: InputDecoration(
            hintText: 'New username',
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: theme.colorScheme.onBackground,
              ),
            ),
          ),
        ),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: _tryToChange,
            child: (_isLoading)
                ? const CircularProgressIndicator()
                : const Text('Save'),
          ),
        ],
      ),
    );
  }
}
