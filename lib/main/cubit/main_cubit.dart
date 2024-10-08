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
      emit(state.copyWith(
          isLoading: false, ghostList: gameController.getGhostList()));
    } catch (error) {
      emit(state.copyWith(error: error.toString()));
      emit(stableState.copyWith(isLoading: false));
    }
  }

  void changeEvidence(Evidence emf5) {
    if (gameController.findedEvidences.contains(emf5)) {
      gameController.removeEvidence(emf5);
    } else {
      gameController.addEvidence(emf5);
    }

    loadInitialData();
  }

  bool isEvidence(Evidence emf5) {
    return gameController.findedEvidences.contains(emf5);
  }

  void setNormalSpeed(Speed? value) {
    gameController.setNormalSpeed(value);
    loadInitialData();
  }

  void setBehaviorHunt(BehaviorHunt value) {
    gameController.setBehaviorHunt(value);
    loadInitialData();
  }

  void setHuntSanity(HuntSanity value) {
    gameController.setHuntSanity(value);
    loadInitialData();
  }

  void reset() {
    gameController.clearFindedEvidences();
    loadInitialData();
  }

  removeGhost(int index) {}

  Future<void> crossOut(int index) async {
    final ghostList = state.ghostList;
    ghostList![index].isCrossedOut = !ghostList[index].isCrossedOut;
    ghostList[index].isPropably = false;
    emit(state.copyWith(ghostList: ghostList));
  }

  Future<void> propably(int index) async {
    final ghostList = state.ghostList;
    ghostList![index].isPropably = !ghostList[index].isPropably;
    ghostList[index].isCrossedOut = false;
    emit(state.copyWith(ghostList: ghostList));
  }
}
