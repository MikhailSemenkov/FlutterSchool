import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/movies.dart';
import '../../data/sessions.dart';

class PaymentInfoWidget extends StatelessWidget {
  const PaymentInfoWidget(
      {Key? key,
      required Movie movie,
      required Session session,
      required int totalPrice,
      required int seatsAmount})
      : _seatsAmount = seatsAmount,
        _totalPrice = totalPrice,
        _session = session,
        _movie = movie,
        super(key: key);

  final Movie _movie;
  final Session _session;
  final int _totalPrice;
  final int _seatsAmount;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formatter = DateFormat('dd/MM/yyyy').add_Hm();
    final theme = Theme.of(context);

    return SizedBox(
      height: size.height / 6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            _movie.smallImage!,
            fit: BoxFit.contain,
          ),
          Container(
            height: size.height / 6,
            width: size.width * 0.5,
            decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${_movie.name!} (${_movie.year})',
                    style: theme.textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${_session.room!.name!} room ${_session.type}',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    formatter.format(
                      DateTime.fromMillisecondsSinceEpoch(
                        _session.date! * 1000,
                      ),
                    ),
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    '$_seatsAmount tickets',
                    style: theme.textTheme.bodySmall,
                  ),
                  Text(
                    'Amount: $_totalPrice UAH',
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
