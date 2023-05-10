part of 'selected_seats_bloc.dart';

abstract class SelectedSeatsState {
  final List<Seats> selectedSeats;

  const SelectedSeatsState(this.selectedSeats);
}

class SelectedSeatsInitial extends SelectedSeatsState {
  SelectedSeatsInitial() : super([]);
}

class SelectedSeatsListState extends SelectedSeatsState {
  const SelectedSeatsListState(super.selectedSeats);
}
