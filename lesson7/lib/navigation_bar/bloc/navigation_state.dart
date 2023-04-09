class NavigationState {
  final int tabNumber;
  final bool isReady;
  final bool isLoading;
  final bool isFinished;
  final bool isFailed;

  NavigationState({
    this.tabNumber = 0,
    this.isReady = false,
    this.isLoading = false,
    this.isFinished = false,
    this.isFailed = false,
  });

  NavigationState copyWith({
    int? tabNumber,
    bool? isReady,
    bool isLoading = false,
    bool isFinished = false,
    bool isFailed = false,
  }) {
    return NavigationState(
      tabNumber: tabNumber ?? this.tabNumber,
      isReady: isReady ?? this.isReady,
      isLoading: isLoading,
      isFinished: isFinished,
      isFailed: isFailed,
    );
  }
}
