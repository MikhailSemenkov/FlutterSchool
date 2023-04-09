import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_event.dart';
import 'package:lesson7/navigation_bar/bloc/navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(tabNumber: 0, isLoading: true)) {
    on<NavigationChangeTabWithSwipeEvent>(_onSwipeChangeTab);
    on<NavigationChangeTabWithTapEvent>(_onTapChangeTab);
    on<NavigationInactiveTabEvent>(_onInactiveTab);
    on<NavigationReturnToTabEvent>(_onReturnToTab);
  }

  _onSwipeChangeTab(
      NavigationEvent event, Emitter<NavigationState> emit) async {
    emit(state.copyWith(isLoading: true, tabNumber: event.tabNumber));
    try {
      await Future.delayed(const Duration(seconds: 1));
      emit(state.copyWith(isFinished: true, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isFailed: true, tabNumber: event.tabNumber));
    }
  }

  _onTapChangeTab(NavigationEvent event, Emitter<NavigationState> emit) {
    emit(state.copyWith(isReady: true, tabNumber: event.tabNumber));
  }

  _onInactiveTab(NavigationEvent event, Emitter<NavigationState> emit) {
    emit(state.copyWith(isReady: false, tabNumber: event.tabNumber));
  }

  _onReturnToTab(NavigationEvent event, Emitter<NavigationState> emit) {
    emit(state.copyWith(
        isFinished: true, isLoading: false, tabNumber: event.tabNumber));
  }
}
