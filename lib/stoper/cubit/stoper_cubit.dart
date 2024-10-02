import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/stoper/cubit/stoper_state.dart';

class StoperCubit extends Cubit<StoperState> {
  StoperCubit() : super(const StoperState());

  Timer? _timer;

  void start() {
    emit(state.copyWith(status: StoperStatus.start, counter: 0));
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      emit(state.copyWith(
          status: StoperStatus.start, counter: state.counter + 1));
    });
  }

  void stop() {
    _timer?.cancel();
    emit(state.copyWith(status: StoperStatus.pause));
  }

  void reset() {
    stop();
    emit(const StoperState(
      counter: 0,
      status: StoperStatus.pause,
      error: null,
    ));
  }
}
