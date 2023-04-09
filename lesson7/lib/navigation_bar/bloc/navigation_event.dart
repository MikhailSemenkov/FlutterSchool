abstract class NavigationEvent {
  final int tabNumber;

  NavigationEvent([this.tabNumber = 0]);
}

class NavigationChangeTabWithSwipeEvent extends NavigationEvent {
  NavigationChangeTabWithSwipeEvent({required int tabNumber})
      : super(tabNumber);
}

class NavigationChangeTabWithTapEvent extends NavigationEvent {
  NavigationChangeTabWithTapEvent({required int tabNumber}) : super(tabNumber);
}

class NavigationInactiveTabEvent extends NavigationEvent {
  NavigationInactiveTabEvent({required int tabNumber}) : super(tabNumber);
}

class NavigationReturnToTabEvent extends NavigationEvent {
  NavigationReturnToTabEvent({required int tabNumber}) : super(tabNumber);
}
