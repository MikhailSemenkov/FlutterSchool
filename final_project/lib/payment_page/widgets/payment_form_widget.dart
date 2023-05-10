import 'package:final_project/api_client/api_client.dart';
import 'package:final_project/data/movies.dart';
import 'package:final_project/data/sessions.dart';
import 'package:final_project/payment_page/formatters/expire_date_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../formatters/card_number_formatter.dart';
import 'payment_info_widget.dart';

class PaymentFormWidget extends StatefulWidget {
  const PaymentFormWidget(
      {Key? key,
      required int totalPrice,
      required List<int> seats,
      required Session session,
      required Movie movie})
      : _movie = movie,
        _totalPrice = totalPrice,
        _seats = seats,
        _session = session,
        super(key: key);

  final int _totalPrice;
  final List<int> _seats;
  final Session _session;
  final Movie _movie;

  @override
  State<PaymentFormWidget> createState() => _PaymentFormWidgetState();
}

class _PaymentFormWidgetState extends State<PaymentFormWidget> {
  late TextEditingController _controller;

  bool _isLoading = false;
  String _email = '';
  String _cardNumber = '';
  String _cvv = '';
  String _expireDate = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool _isCardNumberValid(String cardNumber) {
    return cardNumber.length == 22;
  }

  bool _isCvvValid(String cvv) {
    return cvv.length == 3;
  }

  bool _isExpireDateValid(String expireDate) {
    if (expireDate.length != 5) {
      return false;
    }
    int month = int.parse(expireDate.substring(0, 2));
    int year = int.parse(expireDate.substring(3));
    final now = DateTime.now();
    return (month >= now.month && month < 13 && (2000 + year) >= now.year);
  }

  _tryToPay() {
    APIClient()
        .buyTickets(widget._seats, widget._session.id!, _email, _cardNumber,
            _expireDate, _cvv)
        .then(
      (value) {
        setState(() {
          int counter = 0;
          Navigator.of(context).popUntil(
            (route) => counter++ == 2,
          );
        });
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
                'Error in payment process. Check your payment data and try again'),
          ),
        );
      },
    );
  }

  _getInputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 0,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width - 80;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          PaymentInfoWidget(
            movie: widget._movie,
            session: widget._session,
            totalPrice: widget._totalPrice,
            seatsAmount: widget._seats.length,
          ),
          const SizedBox(height: 20),
          Container(
            width: width,
            height: width / 1.57,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topLeft,
                  radius: 2,
                  colors: [
                    theme.colorScheme.onBackground.withOpacity(0.5),
                    theme.colorScheme.onBackground.withOpacity(0.3),
                    Colors.transparent,
                  ],
                  stops: const [0, 0.4, 1],
                ),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: theme.colorScheme.onBackground)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(16),
                    CardNumberFormatter(),
                  ],
                  cursorColor: theme.colorScheme.onBackground,
                  style: theme.textTheme.bodyMedium,
                  decoration: _getInputDecoration('Card number'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) =>
                      (_isCardNumberValid(input!)) ? null : 'Wrong card number',
                  onChanged: (value) {
                    setState(() {
                      _cardNumber = value;
                    });
                  },
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                          ExpireDateFormatter(),
                        ],
                        cursorColor: theme.colorScheme.onBackground,
                        style: theme.textTheme.bodyMedium,
                        decoration: _getInputDecoration('MM/YY'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (input) =>
                            (_isExpireDateValid(input!)) ? null : 'Wrong date',
                        onChanged: (value) {
                          setState(() {
                            _expireDate = value;
                          });
                        },
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(3),
                        ],
                        cursorColor: theme.colorScheme.onBackground,
                        style: theme.textTheme.bodyMedium,
                        decoration: _getInputDecoration('CVV'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (input) =>
                            (_isCvvValid(input!)) ? null : 'Wrong CVV',
                        onChanged: (value) {
                          setState(() {
                            _cvv = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  cursorColor: theme.colorScheme.onBackground,
                  keyboardType: TextInputType.emailAddress,
                  style: theme.textTheme.bodyMedium,
                  decoration: _getInputDecoration('Email'),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (input) =>
                      _isEmailValid(input!) ? null : 'Wrong email address',
                  onChanged: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: FilledButton(
              onPressed: (_isEmailValid(_email) &&
                      _isCardNumberValid(_cardNumber) &&
                      _isCvvValid(_cvv) &&
                      _isExpireDateValid(_expireDate))
                  ? () {
                      setState(() {
                        _isLoading = true;
                      });
                      _tryToPay();
                    }
                  : null,
              child: (_isLoading)
                  ? const CircularProgressIndicator()
                  : const Text('Pay'),
            ),
          ),
        ],
      ),
    );
  }
}
