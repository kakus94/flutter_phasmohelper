

import 'package:flutter_phasmohelper/controller/game_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupDi() {
  getIt.registerSingleton( GameController());
}