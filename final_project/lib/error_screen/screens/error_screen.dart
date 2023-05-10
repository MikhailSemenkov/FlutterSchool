import 'package:flutter/material.dart';

class ErrorScreen extends StatefulWidget {
  const ErrorScreen(
      {Key? key, required Function onPressed, required String message})
      : _message = message,
        _onPressed = onPressed,
        super(key: key);

  final String _message;
  final Function _onPressed;

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget._message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 80),
          FilledButton(
              onPressed: () {
                setState(() {
                  _isLoading = true;
                });
                widget._onPressed();
              },
              child: (_isLoading)
                  ? const CircularProgressIndicator()
                  : const Text('try again'))
        ],
      ),
    );
  }
}
