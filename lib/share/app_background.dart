import 'package:flutter/material.dart';

class AppBackground {
  static BoxDecoration background_1() {
    return const BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        fit: BoxFit.fitHeight,
        image: AssetImage("assets/background_start.jpg"),
      ),
    );
  }

  static BoxDecoration background_2() {
    return const BoxDecoration(
      image: DecorationImage(
        alignment: Alignment.center,
        fit: BoxFit.fitHeight,
        image: AssetImage("assets/background.png"),
      ),
    );
  }
}
