import 'package:flutter/material.dart';
import 'package:flutter_phasmohelper/share/app_icon.dart';

class AppBackground {
  static BoxDecoration background_1() {
    return BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        fit: BoxFit.fitHeight,
        image: AppIcon.background3.image,
      ),
    );
  }

  static BoxDecoration background_2() {
    return BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        fit: BoxFit.fitHeight,
        image: AppIcon.background2.image,
      ),
    );
  }
}
