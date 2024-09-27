import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/database/database.dart';
import 'package:flutter_phasmohelper/main/main/main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(isLoading: true));

  Future<void> loadInitialData() async {
    print('loadInitialData');
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));

      emit(state.copyWith(isLoading: false, ghostList: Database.ghostList));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}
