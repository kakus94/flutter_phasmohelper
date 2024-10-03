class StartState {
  final bool isLoading;
  final String? error;

  const StartState({
    this.isLoading = false,
    this.error,
  });

  StartState copyWith({
    bool? isLoading,
    String? error,
  }) {
    return StartState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}
