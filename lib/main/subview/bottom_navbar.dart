import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/main/cubit/main_cubit.dart';
import 'package:flutter_phasmohelper/main/cubit/main_state.dart';

import '../../models/enums.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  Color getColor(Evidence evidence) {
    if (getIt<MainCubit>().isEvidence(evidence)) {
      return Colors.green;
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
            height: 80,
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                      color: getColor(Evidence.emf5),
                      child: itemNav("EMF5", 'assets/emf.png',
                          onTap: () => changeEv(Evidence.emf5))),


                  Container(
                    color: getColor(Evidence.spiritBox),
                    child: itemNav("Spiritbox", 'assets/spiritbox.png',
                        onTap: () => getIt<MainCubit>()
                            .changeEvidence(Evidence.spiritBox)),
                  ),


                  Container(
                    color: getColor(Evidence.dots),
                    child: itemNav("D.O.T.S", 'assets/dots.png',
                        onTap: () =>
                            getIt<MainCubit>().changeEvidence(Evidence.dots)),
                  ),


                  Container(
                    color: getColor(Evidence.freezing),
                    child: itemNav("Freezing", 'assets/mrozne.png',
                        onTap: () =>
                            getIt<MainCubit>().changeEvidence(Evidence.freezing)),
                  ),


                  Container(
                    color: getColor(Evidence.orbs),
                    child: itemNav("ORB", 'assets/orb.png',
                        onTap: () =>
                            getIt<MainCubit>().changeEvidence(Evidence.orbs)),
                  ),
                  
                  Container(
                    color: getColor(Evidence.ghostWriting),
                    child: itemNav("Writing", 'assets/pismo.png',
                        onTap: () => getIt<MainCubit>()
                            .changeEvidence(Evidence.ghostWriting)),
                  ),

                  Container(
                    color: getColor(Evidence.ultrafilet),
                    child: itemNav("ultrafiolent", 'assets/ultrafiolet.png',
                        onTap: () => getIt<MainCubit>()
                            .changeEvidence(Evidence.ultrafilet)),
                  ),
                ],
              ),
            ));
      },
    );
  }

  GestureDetector itemNav(String title, String icon,
      {required Function onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Column(
        children: [
          Image.asset(icon),
          Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
