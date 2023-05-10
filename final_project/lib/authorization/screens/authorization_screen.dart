import 'package:final_project/authorization/widgets/authorization_submit_button_widget.dart';
import 'package:final_project/authorization/widgets/phone_number_input_widget.dart';
import 'package:flutter/material.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  String _phoneNumber = '';
  bool _isValid = false;

  _updateNumber(String phoneNumber, bool isValid) {
    setState(() {
      _phoneNumber = phoneNumber;
      _isValid = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Authorization'),
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
                  'Enter your mobile number',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 100,
                ),
                PhoneNumberInputWidget(
                  onInput: _updateNumber,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 40),
                  child: Text(
                    'We\'ll send verification code on this number',
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                AuthorizationSubmitButtonWidget(
                  phoneNumber: _phoneNumber,
                  isValid: _isValid,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
