import 'package:flutter/material.dart';

enum AppIcon {
  emf,
  spiritBox,
  ghostWriting,
  orbs,
  freezing,
  ultrafilet,
  dots,
  background1,
  background2,
  background3
}

extension AppIconExtension on AppIcon {
  String get path {
    switch (this) {
      case AppIcon.emf:
        return 'assets/evidence/emf.png';
      case AppIcon.spiritBox:
        return 'assets/evidence/spiritbox.png';
      case AppIcon.ghostWriting:
        return 'assets/evidence/pismo.png';
      case AppIcon.orbs:
        return 'assets/evidence/orb.png';
      case AppIcon.freezing:
        return 'assets/evidence/mrozne.png';
      case AppIcon.ultrafilet:
        return 'assets/evidence/ultrafiolet.png';
      case AppIcon.dots:
        return 'assets/evidence/dots.png';
      case AppIcon.background1:
        return 'assets/background/background_start.png';
      case AppIcon.background2:
        return 'assets/background/background.png';
      case AppIcon.background3:
        return 'assets/background/background.jpg';
    }
  }

  AssetImage get image => AssetImage(path);
}
