import 'package:flutter_bloc/flutter_bloc.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(tabNumber: 0)) {
    on<NavigationChangeTabWithSwipeEvent>(_onSwipeChangeTab);
    on<NavigationChangeTabWithTapEvent>(_onTapChangeTab);
  }

  _onSwipeChangeTab(
      NavigationEvent event, Emitter<NavigationState> emit) async {
    emit(state.copyWith(
        isFinished: true, isReady: false, tabNumber: event.tabNumber));
  }

  _onTapChangeTab(NavigationEvent event, Emitter<NavigationState> emit) {
    emit(state.copyWith(
        isFinished: true, isReady: true, tabNumber: event.tabNumber));
  }
}
