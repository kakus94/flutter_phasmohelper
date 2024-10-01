import 'package:flutter_phasmohelper/controller/game_controller.dart';
import 'package:flutter_phasmohelper/main/cubit/main_cubit.dart';
import 'package:flutter_phasmohelper/stoper/cubit/stoper_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerSingleton(GameController());
  getIt.registerSingleton(MainCubit());
  getIt.registerSingleton(StoperCubit());
}
