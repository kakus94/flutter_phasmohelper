import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/controller/game_controller.dart';
import 'package:flutter_phasmohelper/main/cubit/main_state.dart';
import 'package:flutter_phasmohelper/models/enums.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(isLoading: true));

final gameController = getIt<GameController>();

  Future<void> loadInitialData() async {
    print('loadInitialData');
    final stableState = state;
    try {
      emit(state.copyWith(isLoading: true));
      gameController.addEvidence(Evidence.freezing);
      emit(state.copyWith(isLoading: false, ghostList: gameController.getGhostList()));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }
}
