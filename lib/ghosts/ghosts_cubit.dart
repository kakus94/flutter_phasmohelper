import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/database/database.dart';
import 'package:flutter_phasmohelper/ghosts/ghosts_state.dart';

class GhostsCubit extends Cubit<GhostsState> {
  GhostsCubit() : super(GhostsState(isLoading: true));

  Future<void> loadInitialData() async {
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));
      emit(state.copyWith(isLoading: false, ghostsList: Database.ghostList));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}
