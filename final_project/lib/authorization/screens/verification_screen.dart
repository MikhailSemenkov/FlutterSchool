import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../bloc/authorization_bloc.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key, required String phoneNumber})
      : _phoneNumber = phoneNumber,
        super(key: key);

  final String _phoneNumber;

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  String _otp = '';
  bool _valid = false;

  _validateCode(String otp) {
    _otp = otp;
    setState(() {
      if (_otp.length != 4) {
        _valid = false;
      } else {
        _valid = true;
      }
    });
  }

  _onVerify() {
    context.read<AuthorizationBloc>().add(
          GenerateAuthorizationTokenEvent(
            phoneNumber: widget._phoneNumber,
            otp: _otp,
          ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Verification'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 6,
                ),
                Text(
                  'Enter verification code',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 100,
                ),
                PinCodeTextField(
                  appContext: context,
                  length: 4,
                  cursorColor: theme.colorScheme.onBackground,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    inactiveColor: Colors.grey,
                    selectedColor: theme.colorScheme.onBackground,
                    activeColor: theme.colorScheme.tertiary,
                    borderWidth: 1.5,
                  ),
                  textStyle: theme.textTheme.titleLarge,
                  keyboardType: TextInputType.number,
                  enablePinAutofill: false,
                  onChanged: _validateCode,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                  child: Text(
                    'Please enter the verification code we send to the number ${widget._phoneNumber}',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                FilledButton(
                  onPressed: (_valid) ? _onVerify : null,
                  child: const Text('Verify'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
