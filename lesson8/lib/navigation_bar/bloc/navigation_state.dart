part of 'navigation_bloc.dart';

class NavigationState {
  final int tabNumber;
  final bool isReady;
  final bool isFinished;

  NavigationState({
    this.tabNumber = 0,
    this.isReady = false,
    this.isFinished = false,
  });

  NavigationState copyWith({
    int? tabNumber,
    bool? isReady,
    bool isFinished = false,
  }) {
    return NavigationState(
      tabNumber: tabNumber ?? this.tabNumber,
      isReady: isReady ?? this.isReady,
      isFinished: isFinished,
    );
  }
}
