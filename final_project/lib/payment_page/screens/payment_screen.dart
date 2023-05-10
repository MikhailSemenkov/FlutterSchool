import 'package:final_project/api_client/api_client.dart';
import 'package:final_project/error_screen/screens/error_screen.dart';
import 'package:final_project/loading_screen/screens/loading_screen.dart';
import 'package:final_project/payment_page/widgets/payment_form_widget.dart';
import 'package:flutter/material.dart';

import '../../data/movies.dart';
import '../../data/sessions.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen(
      {Key? key,
      required int totalPrice,
      required List<Seats> seats,
      required Session session,
      required Movie movie})
      : _movie = movie,
        _session = session,
        _seats = seats,
        _totalPrice = totalPrice,
        super(key: key);

  final int _totalPrice;
  final List<Seats> _seats;
  final Session _session;
  final Movie _movie;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late Future _future;

  @override
  void initState() {
    _future = APIClient().bookTickets(
      _getIntListOfSeats(),
      widget._session.id!,
    );
    super.initState();
  }

  _getIntListOfSeats() => List.generate(
        widget._seats.length,
        (index) => widget._seats[index].id!,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PaymentFormWidget(
              totalPrice: widget._totalPrice,
              seats: _getIntListOfSeats(),
              session: widget._session,
              movie: widget._movie,
            );
          }
          if (snapshot.hasError) {
            return ErrorScreen(
              onPressed: () {
                int count = 0;
                Navigator.of(context).popUntil((route) => count++ == 2);
              },
              message: 'Error while booking',
            );
          }
          return const LoadingScreen();
        },
      ),
    );
  }
}
