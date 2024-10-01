class StoperState {
  final String? error;

  final int counter;
  final StoperStatus status;

  const StoperState({
    this.counter = 0,
    this.status = StoperStatus.pause,
    this.error,
  });

  StoperState copyWith({StoperStatus? status, String? error, int? counter}) {
    return StoperState(
        status: status ?? this.status,
        error: error ?? this.error,
        counter: counter ?? this.counter);
  }
}

enum StoperStatus { start, pause }
