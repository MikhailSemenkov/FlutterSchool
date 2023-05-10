import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/selected_seats_bloc.dart';

class SelectedSeatsListWidget extends StatelessWidget {
  const SelectedSeatsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<SelectedSeatsBloc, SelectedSeatsState>(
      builder: (context, state) {
        return ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              children: List.generate(
                state.selectedSeats.length,
                (index) => Container(
                  width: (MediaQuery.of(context).size.width - 60) / 2,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: FittedBox(
                    child: Text(
                      'Seat: ${state.selectedSeats[index].row}/'
                      '${state.selectedSeats[index].index} '
                      '${state.selectedSeats[index].price} UAH',
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
