import 'package:final_project/choose_seats/bloc/selected_seats_bloc.dart';
import 'package:final_project/data/sessions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SeatWidget extends StatefulWidget {
  const SeatWidget({Key? key, required double seatSize, required Seats seat})
      : _seat = seat,
        _seatSize = seatSize,
        super(key: key);

  final double _seatSize;
  final Seats _seat;

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  late bool _isBooked = false;

  Color _chooseColor() {
    if (!widget._seat.isAvailable!) {
      return Colors.grey;
    }
    if (_isBooked) {
      return Theme.of(context).colorScheme.secondary;
    }
    if (widget._seat.type == 1) {
      return Colors.limeAccent;
    }
    if (widget._seat.type == 2) {
      return Colors.deepPurpleAccent;
    }
    return Colors.blueAccent;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget._seat.isAvailable!) {
            _isBooked = !_isBooked;
            context.read<SelectedSeatsBloc>().add((_isBooked)
                ? AddSeatEvent(seat: widget._seat)
                : RemoveSeatEvent(seat: widget._seat));
          }
        });
      },
      child: Container(
        height: widget._seatSize,
        width: widget._seatSize,
        color: _chooseColor(),
      ),
    );
  }
}
