import 'package:flutter/material.dart';

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
        return 'assets/emf.png';
      case Evidence.dots:
        return 'assets/dots.png';
      case Evidence.spiritBox:
        return 'assets/spiritbox.png';
      case Evidence.ghostWriting:
        return 'assets/pismo.png';
      case Evidence.orbs:
        return 'assets/orb.png';
      case Evidence.freezing:
        return 'assets/mrozne.png';
      case Evidence.ultrafilet:
        return 'assets/ultrafiolet.png';
    }
  }
}

enum Speed { slow, medium, fast, superFast, none }

extension SpeedExtension on Speed {
  String name() {
    switch (this) {
      case Speed.slow:
        return 'SLOW';
      case Speed.medium:
        return 'NORMAL';
      case Speed.fast:
        return 'FAST';
      case Speed.superFast:
        return 'SUPER FAST';
      case Speed.none:
        return 'NONE';
    }
  }
}

enum HuntSanity { lateM40, normalP50, earlyP50, veryEarlyP75, none }

extension HuntSanityExtension on HuntSanity {
  String name() {
    switch (this) {
      case HuntSanity.earlyP50:
        return 'Wczesnie';
      case HuntSanity.normalP50:
        return 'Normalne';
      case HuntSanity.veryEarlyP75:
        return 'Bardziej wczesnie';
      case HuntSanity.lateM40:
        return 'Po wczesnej';
      case HuntSanity.none:
        return 'Brak';
    }
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
  String name() {
    switch (this) {
      case BehaviorHunt.slowsDown:
        return 'Zwalnia';
      case BehaviorHunt.normal:
        return 'bez zmian';
      case BehaviorHunt.speedsUp:
        return 'Zwieksza';
      case BehaviorHunt.none:
        return 'Brak';
    }
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
