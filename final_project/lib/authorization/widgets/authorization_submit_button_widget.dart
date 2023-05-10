import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../api_client/api_client.dart';
import '../bloc/authorization_bloc.dart';
import '../screens/verification_screen.dart';

class AuthorizationSubmitButtonWidget extends StatefulWidget {
  const AuthorizationSubmitButtonWidget(
      {Key? key, required String phoneNumber, required bool isValid})
      : _isValid = isValid,
        _phoneNumber = phoneNumber,
        super(key: key);

  final String _phoneNumber;
  final bool _isValid;

  @override
  State<AuthorizationSubmitButtonWidget> createState() =>
      _AuthorizationSubmitButtonWidgetState();
}

class _AuthorizationSubmitButtonWidgetState
    extends State<AuthorizationSubmitButtonWidget> {
  bool _wasPressed = false;

  Future<bool> _onPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _wasPressed = true;
    });
    try {
      await APIClient().sendOTP(widget._phoneNumber);
      setState(() {
        _wasPressed = false;
      });
      return true;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 2),
          content: Text('Authorization Error. Try again.'),
        ),
      );
      setState(() {
        _wasPressed = false;
      });
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authorizationProvider = BlocProvider.of<AuthorizationBloc>(context);
    return FilledButton(
      onPressed: (!widget._isValid)
          ? null
          : () {
              _onPressed().then(
                (result) {
                  if (result) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BlocProvider.value(
                          value: authorizationProvider,
                          child: VerificationScreen(
                            phoneNumber: widget._phoneNumber,
                          ),
                        ),
                      ),
                    );
                  }
                },
              );
            },
      child: (_wasPressed)
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : const Text('Submit'),
    );
  }
}
