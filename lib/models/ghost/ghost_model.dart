// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter_phasmohelper/models/enums.dart';

class GhostModel {
  GhostModel({
    required this.name,
    required this.evidence,
    required this.evidenceRequired,
    required this.huntSpeedNoSee,
    required this.huntSpeedSee,
    required this.huntSanity,
    required this.huntSanityPrecent,
    required this.canRecognizedHunting,
    required this.difficultyWithoutEvidence,
    required this.infos,
  });

  String name;
  List<Evidence> evidence;
  Evidence? evidenceRequired;
  Speed huntSpeedNoSee;
  Speed? huntSpeedSee;
  HuntSanity huntSanity;
  int huntSanityPrecent;
  CanRecognizedHunting canRecognizedHunting;
  DifficultyWithoutEvidence difficultyWithoutEvidence;
  List<InfoModel> infos;
}

class InfoModel {
  InfoModel({
    required this.title,
    required this.description,
  });

  Map<String, String> title;
  List<Map<String, String>> description;
}
//Wymagany dowod  