import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/start/cubic/start_state.dart';

class StartCubit extends Cubit<StartState> {
  StartCubit() : super(const StartState(isLoading: true));

  Future<void> loadInitialData() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));

      // TODO your code here

      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}
