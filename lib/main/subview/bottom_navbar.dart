import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/ads/ads_widget.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/main/cubit/main_cubit.dart';
import 'package:flutter_phasmohelper/main/cubit/main_state.dart';

import '../../models/enums.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  Color getColor(Evidence evidence) {
    if (getIt<MainCubit>().isEvidence(evidence)) {
      return Colors.green.shade200;
    } else {
      return Colors.transparent;
    }
  }

  changeEv(Evidence evidence) {
    getIt<MainCubit>().changeEvidence(evidence);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: getIt<MainCubit>(),
      builder: (BuildContext context, MainState state) {
        return SizedBox(
            height: 140,
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              // color: Colors.red,
              child: Column(
                children: [
                  MyBannerAdWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      itemNav(
                        "EMF5",
                        'assets/emf.png',
                        Evidence.emf5,
                        onTap: () => changeEv(Evidence.emf5),
                      ),
                      itemNav(
                        "Spiritbox",
                        'assets/spiritbox.png',
                        Evidence.spiritBox,
                        onTap: () => changeEv(Evidence.spiritBox),
                      ),
                      itemNav(
                        "D.O.T.S",
                        'assets/dots.png',
                        Evidence.dots,
                        onTap: () => changeEv(Evidence.dots),
                      ),
                      itemNav(
                        "Freezing",
                        'assets/mrozne.png',
                        Evidence.freezing,
                        onTap: () => changeEv(Evidence.freezing),
                      ),
                      itemNav(
                        "ORB",
                        'assets/orb.png',
                        Evidence.orbs,
                        onTap: () => changeEv(Evidence.orbs),
                      ),
                      itemNav(
                        "Writing",
                        'assets/pismo.png',
                        Evidence.ghostWriting,
                        onTap: () => changeEv(Evidence.ghostWriting),
                      ),
                      itemNav(
                        "ultrafiolent",
                        'assets/ultrafiolet.png',
                        Evidence.ultrafilet,
                        onTap: () => changeEv(Evidence.ultrafilet),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      },
    );
  }

  SizedBox itemNav(String title, String icon, Evidence evidence,
      {required Function onTap}) {
    return SizedBox(
      width: 50,
      height: 75,
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: getColor(evidence),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
