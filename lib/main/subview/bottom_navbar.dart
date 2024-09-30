



import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 80,  
        child: Container(
      padding: const EdgeInsets.only(top: 10),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
           itemNav("EMF5", 'assets/emf.png'),
           itemNav("Spiritbox", 'assets/spiritbox.png'),
           itemNav("D.O.T.S", 'assets/dots.png'),
           itemNav("Freezing", 'assets/mrozne.png'),
           itemNav("ORB", 'assets/orb.png'),
           itemNav("Writing", 'assets/pismo.png'),
           itemNav("ultrafiolent", 'assets/ultrafiolet.png'),
        ],
      ),
    ));
  }



  Column itemNav(String title, String icon) {
    return Column(
      children: [
        Image.asset(icon),
        Text(
          title,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

}