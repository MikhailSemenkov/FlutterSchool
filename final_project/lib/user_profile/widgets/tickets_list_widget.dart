import 'package:final_project/user_profile/widgets/ticket_info_widget.dart';
import 'package:final_project/user_profile/widgets/ticket_painter.dart';
import 'package:flutter/material.dart';

import '../../data/user.dart';

class TicketsListWidget extends StatelessWidget {
  const TicketsListWidget({Key? key, required List<Data> tickets})
      : _tickets = tickets,
        super(key: key);

  final List<Data> _tickets;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'Tickets',
          style: theme.textTheme.titleMedium,
        ),
        Builder(
          builder: (context) {
            return Flexible(
              child: ListView.separated(
                itemCount: _tickets.length,
                separatorBuilder: (context, index) => const Divider(
                  thickness: 1,
                ),
                itemBuilder: (context, index) => Row(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 80,
                      child: Image.network(_tickets[index].smallImage!),
                    ),
                    Stack(
                      children: [
                        CustomPaint(
                          size: const Size(220, 120),
                          painter: TicketPainter(
                            ticketColor: theme.colorScheme.secondary,
                            backgroundColor: theme.colorScheme.background,
                          ),
                        ),
                        TicketInfoWidget(ticket: _tickets[index]),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
