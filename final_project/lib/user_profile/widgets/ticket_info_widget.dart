import 'package:final_project/data/user.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/ticket_qr_screen.dart';

class TicketInfoWidget extends StatelessWidget {
  const TicketInfoWidget({Key? key, required Data ticket})
      : _ticket = ticket,
        super(key: key);

  final Data _ticket;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    DateFormat dateFormat = DateFormat('dd/MM/yyyy').add_Hm();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          SizedBox(
            height: 80,
            width: 220 * 0.75 - 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _ticket.name!,
                  style: theme.textTheme.labelMedium,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  dateFormat.format(
                    DateTime.fromMillisecondsSinceEpoch(_ticket.date! * 1000),
                  ),
                  style: theme.textTheme.labelSmall,
                ),
                const Expanded(child: SizedBox()),
                Text(
                  '${_ticket.roomName} room',
                  style: theme.textTheme.labelSmall,
                ),
                Text(
                  '${_ticket.rowIndex} row, ${_ticket.seatIndex} place',
                  style: theme.textTheme.labelSmall,
                )
              ],
            ),
          ),
          SizedBox(
            height: 80,
            width: 220 * 0.25 - 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                (_ticket.date! >
                        DateTime.now().millisecondsSinceEpoch / 1000 -
                            1.5 * 3600)
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  TicketQR(ticketData: _ticket),
                            ),
                          );
                        },
                        child: const Icon(Icons.qr_code_2),
                      )
                    : RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          'Expired',
                          style: theme.textTheme.titleMedium
                              ?.copyWith(color: theme.colorScheme.onError),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
