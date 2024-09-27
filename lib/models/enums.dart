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

enum Speed { slow, medium, fast, superFast }

enum HuntSanity { lateM40, normalP50, earlyP50, veryEarlyP75 }

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
