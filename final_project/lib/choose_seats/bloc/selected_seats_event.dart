part of 'selected_seats_bloc.dart';

abstract class SelectedSeatsEvent {
  final Seats seat;

  SelectedSeatsEvent(this.seat);
}

class AddSeatEvent extends SelectedSeatsEvent {
  AddSeatEvent({required Seats seat}) : super(seat);
}

class RemoveSeatEvent extends SelectedSeatsEvent {
  RemoveSeatEvent({required Seats seat}) : super(seat);
}
