// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/models/enums.dart';

class GhostModel {
  GhostModel({
    required this.name,
    required this.evidence,
    required this.evidenceRequired,
    required this.huntSpeedNoSee,
    required this.behaviorHunt,
    required this.huntSanity,
    required this.huntSanityPrecent,
    required this.canRecognizedHunting,
    required this.difficultyWithoutEvidence,
    required this.infos,
    required this.nature,
    required this.speed,
    this.isCrossedOut = false,
    this.isPropably = false,
  });

  String name;
  List<Evidence> evidence;
  Evidence? evidenceRequired;
  Speed huntSpeedNoSee;
  BehaviorHunt? behaviorHunt;
  HuntSanity huntSanity;
  int huntSanityPrecent;
  CanRecognizedHunting canRecognizedHunting;
  DifficultyWithoutEvidence difficultyWithoutEvidence;
  List<InfoModel> infos;
  Nature? nature;
  String speed;

  bool isCrossedOut;
  bool isPropably;

  Color? getColor() {
    if (isCrossedOut) {
      return Colors.red.withOpacity(0.7);
    } else if (isPropably) {
      return Colors.green.withOpacity(0.7);
    }
    return null;
  }
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