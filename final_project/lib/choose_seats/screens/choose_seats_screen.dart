import 'dart:math';

import 'package:final_project/choose_seats/bloc/selected_seats_bloc.dart';
import 'package:final_project/choose_seats/widgets/seat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/movies.dart';
import '../../data/sessions.dart';
import '../../payment_page/screens/payment_screen.dart';
import '../widgets/screen_widget.dart';
import '../widgets/seats_type_marking_widget.dart';
import '../widgets/selected_seats_list_widget.dart';

class ChooseSeatsScreen extends StatefulWidget {
  const ChooseSeatsScreen(
      {Key? key, required Session session, required Movie movie})
      : _movie = movie,
        _session = session,
        super(key: key);

  final Session _session;
  final Movie _movie;

  @override
  State<ChooseSeatsScreen> createState() => _ChooseSeatsScreenState();
}

class _ChooseSeatsScreenState extends State<ChooseSeatsScreen> {
  late double _seatSize;
  int _totalPrice = 0;
  static const double _placeBetweenSeats = 15;
  static const double _padding = 20;
  static const double _margin = 10;
  static const double _screenHeight = 2 * _placeBetweenSeats;

  _calculateSeatSize(double roomSize) {
    final columns = widget._session.room!.maxSeatsInRow;
    final rows = widget._session.room!.rows!.length;
    final xSeatSize =
        (roomSize - (columns - 1) * _placeBetweenSeats - 2 * _margin) / columns;
    final ySeatSize = (roomSize -
            (rows - 1) * _placeBetweenSeats -
            _screenHeight -
            3 * _margin) /
        rows;
    _seatSize = min(xSeatSize, ySeatSize);
  }

  List<Positioned> _generateSeats(double roomSize) {
    List<Positioned> seats = [];
    final rows = widget._session.room!.rows!.length;
    final dy = _screenHeight +
        2 * _margin +
        (roomSize -
                _screenHeight -
                2 * _margin -
                rows * (_placeBetweenSeats + _seatSize) +
                _placeBetweenSeats) /
            2;
    for (int i = 0; i < rows; i++) {
      final columns = widget._session.room!.rows![i].seats!.length;
      final dx = _margin +
          (roomSize -
                  2 * _margin -
                  columns * (_placeBetweenSeats + _seatSize) +
                  _placeBetweenSeats) /
              2;
      for (int j = 0; j < columns; j++) {
        seats.add(
          Positioned(
            left: dx + j * (_placeBetweenSeats + _seatSize),
            top: dy + i * (_placeBetweenSeats + _seatSize),
            child: SeatWidget(
              seatSize: _seatSize,
              seat: widget._session.room!.rows![i].seats![j],
            ),
          ),
        );
      }
    }
    return seats;
  }

  _calculateTotalPrice(List<Seats> seats) {
    _totalPrice = 0;
    for (var element in seats) {
      _totalPrice += element.price!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    double roomWidth = MediaQuery.of(context).size.width;
    double usedRoomWidth = roomWidth - 2 * _padding;
    _calculateSeatSize(usedRoomWidth);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget._session.room!.name!),
      ),
      body: BlocProvider<SelectedSeatsBloc>(
        create: (context) => SelectedSeatsBloc(),
        child: Padding(
          padding: const EdgeInsets.all(_padding),
          child: Column(
            children: [
              SizedBox(
                height: roomWidth,
                width: roomWidth,
                child: Stack(
                  children: [
                    const ScreenWidget(
                      margin: _margin,
                      screenHeight: _screenHeight,
                    ),
                    ..._generateSeats(usedRoomWidth),
                  ],
                ),
              ),
              const SeatsTypeMarkingWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Cart',
                      style: theme.textTheme.titleMedium,
                    ),
                  ],
                ),
              ),
              const Expanded(child: SelectedSeatsListWidget()),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text(
                      'Total price: ',
                      style: theme.textTheme.bodyLarge,
                    ),
                    BlocListener<SelectedSeatsBloc, SelectedSeatsState>(
                      listenWhen: (previous, current) => true,
                      listener: (context, state) {
                        setState(() {
                          _calculateTotalPrice(state.selectedSeats);
                        });
                      },
                      child: Text(
                        '$_totalPrice',
                        style: theme.textTheme.titleSmall,
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (context) {
                  final selectedSeats =
                      BlocProvider.of<SelectedSeatsBloc>(context)
                          .state
                          .selectedSeats;
                  return FilledButton(
                      onPressed: (selectedSeats.isNotEmpty)
                          ? () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                    totalPrice: _totalPrice,
                                    seats: selectedSeats,
                                    session: widget._session,
                                    movie: widget._movie,
                                  ),
                                ),
                              );
                              setState(() {});
                            }
                          : null,
                      child: const Text('Buy'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
