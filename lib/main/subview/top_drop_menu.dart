// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phasmohelper/config/di.dart';
import 'package:flutter_phasmohelper/controller/game_controller.dart';
import 'package:flutter_phasmohelper/main/cubit/main_cubit.dart';
import 'package:flutter_phasmohelper/main/cubit/main_state.dart';
import 'package:flutter_phasmohelper/models/enums.dart';
import 'package:flutter_gen/gen_l10n/arb_localization.dart';

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
    final lang = AppLocalizations.of(context)?.localeName ?? 'pl';
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
          PopupMenuItem(
            value: Speed.none,
            child: Text(AppLocalizations.of(context)?.none ?? "lang error"),
          ),
          PopupMenuItem(
            value: Speed.slow,
            child: Text(AppLocalizations.of(context)?.slow ?? "lang error"),
          ),
          PopupMenuItem(
            value: Speed.medium,
            child: Text(AppLocalizations.of(context)?.normal ?? "lang error"),
          ),
          PopupMenuItem(
            value: Speed.fast,
            child: Text(AppLocalizations.of(context)?.fast ?? "lang error"),
          ),
          PopupMenuItem(
            value: Speed.superFast,
            child:
                Text(AppLocalizations.of(context)?.superFast ?? "lang error"),
          ),
        ];
      },
      child: Row(
        children: [
          const Icon(Icons.speed),
          Text(getIt<GameController>().norlmalSpeed?.name(lang) ??
              AppLocalizations.of(context)?.speedNormalNull ??
              "lang error"),
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
          PopupMenuItem(
            value: BehaviorHunt.none,
            child: Text(AppLocalizations.of(context)?.none ?? "lang error"),
          ),
          PopupMenuItem(
            value: BehaviorHunt.slowsDown,
            child: Text(AppLocalizations.of(context)?.slowDown ?? "lang error"),
          ),
          PopupMenuItem(
            value: BehaviorHunt.normal,
            child: Text(AppLocalizations.of(context)?.noChange ?? "lang error"),
          ),
          PopupMenuItem(
            value: BehaviorHunt.speedsUp,
            child: Text(AppLocalizations.of(context)?.speedUp ?? "lang error"),
          ),
        ];
      },
      // icon: const Icon(Icons.format_align_justify),
      child: Row(
        children: [
          const Icon(Icons.thermostat),
          Text(getIt<GameController>().behaviorHunt?.name('pl') ??
              AppLocalizations.of(context)?.behaviorHunt ??
              "lang error"),
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
          PopupMenuItem(
            value: HuntSanity.none,
            child: Text(AppLocalizations.of(context)?.none ?? "lang error"),
          ),
          PopupMenuItem(
            value: HuntSanity.veryEarlyP75,
            child: Text(
                AppLocalizations.of(context)?.veryErlyHunt ?? "lang error"),
          ),
          PopupMenuItem(
            value: HuntSanity.earlyP50,
            child: Text(AppLocalizations.of(context)?.erlyHunt ?? "lang error"),
          ),
          PopupMenuItem(
            value: HuntSanity.normalP50,
            child:
                Text(AppLocalizations.of(context)?.normalHunt ?? "lang error"),
          ),
          PopupMenuItem(
            value: HuntSanity.lateM40,
            child: Text(AppLocalizations.of(context)?.lateHunt ?? "lang error"),
          ),
        ];
      },
      // icon: const Icon(Icons.format_align_justify),
      child: Row(
        children: [
          const Icon(Icons.timer),
          Text(getIt<GameController>().huntSanity?.name('pl') ??
              AppLocalizations.of(context)?.huntSanity ??
              "lang error"),
        ],
      ),
    );
  }
}
