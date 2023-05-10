import 'package:final_project/data/sessions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'selected_seats_event.dart';
part 'selected_seats_state.dart';

class SelectedSeatsBloc extends Bloc<SelectedSeatsEvent, SelectedSeatsState> {
  SelectedSeatsBloc() : super(SelectedSeatsInitial()) {
    on<AddSeatEvent>(_onAdd);
    on<RemoveSeatEvent>(_onRemove);
  }

  _onAdd(SelectedSeatsEvent event, Emitter<SelectedSeatsState> emit) {
    state.selectedSeats.add(event.seat);
    emit(SelectedSeatsListState(state.selectedSeats));
  }

  _onRemove(SelectedSeatsEvent event, Emitter<SelectedSeatsState> emit) {
    state.selectedSeats.remove(event.seat);
    emit(SelectedSeatsListState(state.selectedSeats));
  }
}
