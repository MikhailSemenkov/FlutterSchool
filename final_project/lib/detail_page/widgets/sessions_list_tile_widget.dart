import 'package:final_project/choose_seats/screens/choose_seats_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/movies.dart';
import '../../data/sessions.dart';

class SessionsListTileWidget extends StatelessWidget {
  const SessionsListTileWidget(
      {Key? key, required Session session, required Movie movie})
      : _movie = movie,
        _session = session,
        super(key: key);

  final Session _session;
  final Movie _movie;

  @override
  Widget build(BuildContext context) {
    final formatter = DateFormat(DateFormat.HOUR24_MINUTE);
    final theme = Theme.of(context);
    return SizedBox(
      height: 110,
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${formatter.format(
                    DateTime.fromMillisecondsSinceEpoch(
                      _session.date! * 1000,
                    ),
                  )} ${_session.type}',
                  style: theme.textTheme.labelLarge,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '${_session.room!.name} room (${_session.room!.totalAvailable} available)',
                  style: theme.textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Min price: ${_session.minPrice}',
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
            Builder(builder: (context) {
              if (_session.date! <
                  DateTime.now().millisecondsSinceEpoch / 1000) {
                return Text(
                  'Ended',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: theme.colorScheme.onError),
                );
              }
              if (_session.room!.totalAvailable == 0) {
                return Text(
                  'Sold out',
                  style: theme.textTheme.titleMedium
                      ?.copyWith(color: theme.colorScheme.onError),
                );
              }
              return IconButton(
                color: theme.colorScheme.secondary,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChooseSeatsScreen(
                        session: _session,
                        movie: _movie,
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.payment),
              );
            }),
          ],
        ),
      ),
    );
  }
}
