import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/share/app_icon.dart';

enum Evidence {
  emf5,
  dots,
  spiritBox,
  ghostWriting,
  orbs,
  freezing,
  ultrafilet
}

extension EvidenceExtension on Evidence {
  String imagePath() {
    switch (this) {
      case Evidence.emf5:
        return AppIcon.emf.path;
      case Evidence.dots:
        return AppIcon.dots.path;
      case Evidence.spiritBox:
        return AppIcon.spiritBox.path;
      case Evidence.ghostWriting:
        return AppIcon.ghostWriting.path;
      case Evidence.orbs:
        return AppIcon.orbs.path;
      case Evidence.freezing:
        return AppIcon.freezing.path;
      case Evidence.ultrafilet:
        return AppIcon.ultrafilet.path;
    }
  }
}

enum Speed { slow, medium, fast, superFast, none }

extension SpeedExtension on Speed {
  get _name {
    switch (this) {
      case Speed.slow:
        return {'en': 'Slow', 'pl': 'Wolny'};
      case Speed.medium:
        return {'en': 'Normal', 'pl': 'Normalny'};
      case Speed.fast:
        return {'en': 'Fast', 'pl': 'Szybki'};
      case Speed.superFast:
        return {'en': 'Super Fast', 'pl': 'Super szybki'};
      case Speed.none:
        return {'en': 'None', 'pl': 'Brak'};
    }
  }

  String name(String key) {
    return _name[key];
  }
}

enum HuntSanity { lateM40, normalP50, earlyP50, veryEarlyP75, none }

extension HuntSanityExtension on HuntSanity {
  get _name {
    switch (this) {
      case HuntSanity.earlyP50:
        return {'en': 'Early', 'pl': 'Wczesny'};
      case HuntSanity.normalP50:
        return {'en': 'Normal', 'pl': 'Normalny'};
      case HuntSanity.veryEarlyP75:
        return {'en': 'Very Early', 'pl': 'Bardziej wczesny'};
      case HuntSanity.lateM40:
        return {'en': 'Late', 'pl': 'Późny'};
      case HuntSanity.none:
        return {'en': 'None', 'pl': 'Brak'};
    }
  }

  String name(String key) {
    return _name[key];
  }

  int value() {
    switch (this) {
      case HuntSanity.earlyP50:
        return 50;
      case HuntSanity.normalP50:
        return 50;
      case HuntSanity.veryEarlyP75:
        return 75;
      case HuntSanity.lateM40:
        return 40;
      case HuntSanity.none:
        return 0;
    }
  }

  int weight() {
    switch (this) {
      case HuntSanity.veryEarlyP75:
        return 1;
      case HuntSanity.earlyP50:
        return 2;
      case HuntSanity.normalP50:
        return 3;
      case HuntSanity.lateM40:
        return 4;
      case HuntSanity.none:
        return 5;
    }
  }

  bool isHuntPosible(HuntSanity huntSanity) {
    return weight() <= huntSanity.weight();
  }
}

enum DifficultyLevel {
  amator,
  intermidiate,
  profesional,
  nightmare,
  insanity,
  apocalipse
}

enum CanRecognizedHunting { yes, no, maybe }

enum DifficultyWithoutEvidence { easy, medium, hard, posibleMultiolayer }

enum BehaviorHunt { slowsDown, normal, speedsUp, none }

extension BehaviorHuntExtension on BehaviorHunt {
  get _name {
    switch (this) {
      case BehaviorHunt.slowsDown:
        return {'en': 'Slows Down', 'pl': 'Zwalnia'};
      case BehaviorHunt.normal:
        return {'en': 'Normal', 'pl': 'Normalny'};
      case BehaviorHunt.speedsUp:
        return {'en': 'Speeds Up', 'pl': 'Przyspiesza'};
      case BehaviorHunt.none:
        return {'en': 'None', 'pl': 'Brak'};
    }
  }

  String name(String key) {
    return _name[key];
  }
}

enum Nature { temp, sanity, power, fire, light, force, fast, loud }

extension NatureExtension on Nature {
  String name() {
    switch (this) {
      case Nature.temp:
        return 'TEMP';
      case Nature.sanity:
        return 'SANITY';
      case Nature.power:
        return 'POWER';
      case Nature.fire:
        return 'FIRE';
      case Nature.light:
        return 'LIGHT';
      case Nature.force:
        return 'FORCE';
      case Nature.fast:
        return 'FAST';
      case Nature.loud:
        return 'LOUD';
    }
  }

  IconData icon() {
    switch (this) {
      case Nature.temp:
        return Icons.thermostat_outlined;
      case Nature.sanity:
        return Icons.psychology_outlined;
      case Nature.power:
        return Icons.power_outlined;
      case Nature.fire:
        return Icons.local_fire_department_outlined;
      case Nature.light:
        return Icons.lightbulb_outlined;
      case Nature.force:
        return Icons.heat_pump_outlined;
      case Nature.fast:
        return Icons.speed_outlined;
      case Nature.loud:
        return Icons.volume_up_outlined;
    }
  }
}
