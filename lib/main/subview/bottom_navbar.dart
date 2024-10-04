import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_phasmohelper/ads/ads_widget.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/main/cubit/main_cubit.dart';
import 'package:flutter_phasmohelper/main/cubit/main_state.dart';
import 'package:flutter_phasmohelper/share/app_icon.dart';

import '../../models/enums.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  Color getColor(Evidence evidence) {
    if (getIt<MainCubit>().isEvidence(evidence)) {
      return Colors.green.shade200;
    } else {
      return Colors.grey.shade200.withAlpha(80);
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
            height: 80,
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(75, 0, 0, 0),
                  Color.fromARGB(255, 0, 0, 0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              // padding: const EdgeInsets.only(top: 10),
              // color: Colors.red,
              child: Column(
                children: [
                  // MyBannerAdWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      itemNav(
                        "EMF5",
                        AppIcon.emf.path,
                        Evidence.emf5,
                        onTap: () => changeEv(Evidence.emf5),
                      ),
                      itemNav(
                        "Speek",
                        AppIcon.spiritBox.path,
                        Evidence.spiritBox,
                        onTap: () => changeEv(Evidence.spiritBox),
                      ),
                      itemNav(
                        "D.O.T.S",
                        AppIcon.dots.path,
                        Evidence.dots,
                        onTap: () => changeEv(Evidence.dots),
                      ),
                      itemNav(
                        "Freez",
                        AppIcon.freezing.path,
                        Evidence.freezing,
                        onTap: () => changeEv(Evidence.freezing),
                      ),
                      itemNav(
                        "ORB",
                        AppIcon.orbs.path,
                        Evidence.orbs,
                        onTap: () => changeEv(Evidence.orbs),
                      ),
                      itemNav(
                        "Writing",
                        AppIcon.ghostWriting.path,
                        Evidence.ghostWriting,
                        onTap: () => changeEv(Evidence.ghostWriting),
                      ),
                      itemNav(
                        "ultra",
                        AppIcon.ultrafilet.path,
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
      height: 50,
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
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
