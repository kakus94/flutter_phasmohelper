// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/controller/game_controller.dart';
import 'package:flutter_phasmohelper/main/cubit/main_cubit.dart';
import 'package:flutter_phasmohelper/main/cubit/main_state.dart';
import 'package:flutter_phasmohelper/models/enums.dart';

class TopDropMenu extends StatelessWidget {
  TopDropMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      bloc: getIt<MainCubit>(),
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.only(left: 10, right: 10),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _Decoration(widget: _FastHuntNormal()),
              const SizedBox(width: 10),
              _Decoration(widget: _BehaviorHunt()),
              const SizedBox(width: 10),
              _Decoration(widget: _HuntTime()),
              const SizedBox(width: 10),
            ],
          ),
        );
      },
    );
  }
}

class _Decoration extends StatelessWidget {
  _Decoration({required this.widget});

  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 5, top: 5, left: 15, right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 215, 215, 215)),
        child: widget);
  }
}

class _FastHuntNormal extends StatelessWidget {
  _FastHuntNormal();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Speed?>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      initialValue: null,

      constraints:
          const BoxConstraints(maxHeight: 300, maxWidth: 300, minWidth: 100),
      // color: colorDialog,
      onSelected: (value) {
        getIt<MainCubit>().setNormalSpeed(value);
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: Speed.none,
            child: Text("brak"),
          ),
          const PopupMenuItem(
            value: Speed.slow,
            child: Text("slow"),
          ),
          const PopupMenuItem(
            value: Speed.medium,
            child: Text("normal"),
          ),
          const PopupMenuItem(
            value: Speed.fast,
            child: Text("fast"),
          ),
          const PopupMenuItem(
            value: Speed.superFast,
            child: Text("very fast"),
          ),
        ];
      },
      child: Row(
        children: [
          const Icon(Icons.speed),
          Text(getIt<GameController>().norlmalSpeed?.name('pl') ?? "brak"),
        ],
      ),
    );
  }
}

class _BehaviorHunt extends StatelessWidget {
  _BehaviorHunt();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<BehaviorHunt>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 200,
        minWidth: 75,
      ),
      // color: colorDialog,
      onSelected: (value) {
        getIt<MainCubit>().setBehaviorHunt(value);
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: BehaviorHunt.none,
            child: Text("Brak"),
          ),
          const PopupMenuItem(
            value: BehaviorHunt.slowsDown,
            child: Text("Zwalnia"),
          ),
          const PopupMenuItem(
            value: BehaviorHunt.normal,
            child: Text("bez zmian"),
          ),
          const PopupMenuItem(
            value: BehaviorHunt.speedsUp,
            child: Text("Przyspiesza"),
          ),
        ];
      },
      // icon: const Icon(Icons.format_align_justify),
      child: Row(
        children: [
          const Icon(Icons.thermostat),
          Text(getIt<GameController>().behaviorHunt?.name('pl') ?? "Brak"),
        ],
      ),
    );
  }
}

class _HuntTime extends StatelessWidget {
  _HuntTime();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<HuntSanity>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      constraints: const BoxConstraints(
        maxHeight: 300,
        maxWidth: 200,
        minWidth: 75,
      ),
      // color: colorDialog,
      onSelected: (value) {
        getIt<MainCubit>().setHuntSanity(value);
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem(
            value: HuntSanity.none,
            child: Text("Brak"),
          ),
          const PopupMenuItem(
            value: HuntSanity.veryEarlyP75,
            child: Text("Bardzej wczesnie >75"),
          ),
          const PopupMenuItem(
            value: HuntSanity.earlyP50,
            child: Text("Wczesnie >50"),
          ),
          const PopupMenuItem(
            value: HuntSanity.normalP50,
            child: Text("Normalnie <50"),
          ),
          const PopupMenuItem(
            value: HuntSanity.lateM40,
            child: Text("Późno <40"),
          ),
        ];
      },
      // icon: const Icon(Icons.format_align_justify),
      child: Row(
        children: [
          const Icon(Icons.timer),
          Text(getIt<GameController>().huntSanity?.name('pl') ?? "Brak"),
        ],
      ),
    );
  }
}
