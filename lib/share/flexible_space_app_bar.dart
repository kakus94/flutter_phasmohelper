// ignore_for_file: must_be_immutable, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class FlexibleSpaceAppBar extends StatelessWidget {
  const FlexibleSpaceAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(75, 0, 0, 0),
            Color.fromARGB(255, 0, 0, 0),
          ],
        ),
      ),
    );
  }
}
