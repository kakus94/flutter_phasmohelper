import 'dart:math';

import 'package:flutter_phasmohelper/controller/game_controller.dart';
import 'package:flutter_phasmohelper/models/enums.dart';
import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  GameController gameController = GameController();

  GhostModel ghostModel = GhostModel(
    name: 'Thaye',
    evidence: [Evidence.dots, Evidence.ghostWriting, Evidence.orbs],
    evidenceRequired: null,
    huntSanity: HuntSanity.veryEarlyP75,
    huntSanityPrecent: 75,
    huntSpeedNoSee: Speed.fast,
    behaviorHunt: BehaviorHunt.slowsDown,
    canRecognizedHunting: CanRecognizedHunting.yes,
    difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
    nature: null,
    speed: "1.0-2.75 m/s",
    infos: [
      InfoModel(
        title: {'pl': 'info', 'en': 'info'},
        description: [
          {
            'pl':
                "wraz z upływem czasu starzeje się, tablica ouija pokazuje zwiększone wartości w odpowiedzi na pytanie o wiek ducha.",
            'en':
                "Aging over time; the Ouija board shows increased values in response to questions about the ghost's age."
          },
          {
            'pl':
                "im starszy tym wolniejszy, poziom psychiki wymagany do rozpoczęcia polowania stale maleje (-6% za każdy etap starzenia ducha, czyli jeśli duch zestarzeje się 1 raz to może rozpocząć polowanie poniżej 69%, jeśli 2 razy to poniżej 63%, itd. aż do 15% psychiki na 10 poziomie zestarzenia).",
            'en':
                "The older it gets, the slower it becomes; the sanity level required to start a hunt steadily decreases (-6% for each stage of ghost aging, meaning if the ghost ages once, it can start a hunt below 69%, if twice below 63%, etc., down to 15% sanity at the 10th aging level)."
          },
          {
            'pl': "bardziej aktywny kiedy jest młody.",
            'en': "More active when it is young."
          }
        ],
      ),
    ],
  );

  test("behavior", () async {
    gameController.ghostList = [ghostModel];
    expect(gameController.getGhostList(), [ghostModel]);

    BehaviorHunt behaviorHunt = BehaviorHunt.none;
    gameController.setBehaviorHunt(behaviorHunt);

    expect(gameController.getGhostList(), [ghostModel]);

    behaviorHunt = BehaviorHunt.slowsDown;
    gameController.setBehaviorHunt(behaviorHunt);
    expect(gameController.getGhostList(), [ghostModel]);

    behaviorHunt = BehaviorHunt.normal;
    gameController.setBehaviorHunt(behaviorHunt);
    expect(gameController.getGhostList(), []);

    behaviorHunt = BehaviorHunt.speedsUp;
    gameController.setBehaviorHunt(behaviorHunt);
    expect(gameController.getGhostList(), []);

    ghostModel.behaviorHunt = BehaviorHunt.speedsUp;

    behaviorHunt = BehaviorHunt.none;
    gameController.setBehaviorHunt(behaviorHunt);
    expect(gameController.getGhostList(), [ghostModel]);

    behaviorHunt = BehaviorHunt.slowsDown;
    gameController.setBehaviorHunt(behaviorHunt);
    expect(gameController.getGhostList(), []);

    behaviorHunt = BehaviorHunt.normal;
    gameController.setBehaviorHunt(behaviorHunt);
    expect(gameController.getGhostList(), []);

    behaviorHunt = BehaviorHunt.speedsUp;
    gameController.setBehaviorHunt(behaviorHunt);
    expect(gameController.getGhostList(), [ghostModel]);
  });

  test("setNormalSpeed", () async {
    gameController.ghostList = [ghostModel];
    Speed speed = Speed.none;

    gameController.setNormalSpeed(speed);
    expect(gameController.getGhostList(), [ghostModel]);

    speed = Speed.slow;

    gameController.setNormalSpeed(speed);
    expect(gameController.getGhostList(), []);

    speed = Speed.medium;

    gameController.setNormalSpeed(speed);
    expect(gameController.getGhostList(), []);

    speed = Speed.fast;

    gameController.setNormalSpeed(speed);
    expect(gameController.getGhostList(), [ghostModel]);

    speed = Speed.superFast;

    gameController.setNormalSpeed(speed);
    expect(gameController.getGhostList(), []);
  });

  test("setHuntSanity", () async {
    gameController.ghostList = [ghostModel];
    HuntSanity huntSanity = HuntSanity.none;

    gameController.setHuntSanity(huntSanity);
    expect(gameController.getGhostList(), [ghostModel]);

    huntSanity = HuntSanity.veryEarlyP75;

    gameController.setHuntSanity(huntSanity);
    expect(gameController.getGhostList(), [ghostModel]);

    huntSanity = HuntSanity.normalP50;

    gameController.setHuntSanity(huntSanity);
    expect(gameController.getGhostList(), [ghostModel]);

    huntSanity = HuntSanity.lateM40;

    gameController.setHuntSanity(huntSanity);
    expect(gameController.getGhostList(), [ghostModel]);

/////////////////////////////////
    ghostModel.huntSanity = HuntSanity.normalP50;
    huntSanity = HuntSanity.veryEarlyP75;

    gameController.setHuntSanity(huntSanity);
    expect(gameController.getGhostList(), []);

    huntSanity = HuntSanity.normalP50;

    gameController.setHuntSanity(huntSanity);
    expect(gameController.getGhostList(), [ghostModel]);

    huntSanity = HuntSanity.lateM40;

    gameController.setHuntSanity(huntSanity);
    expect(gameController.getGhostList(), [ghostModel]);
  });

  test("description", () async {
    HuntSanity huntSanity = HuntSanity.veryEarlyP75;
    expect(huntSanity.isHuntPosible(HuntSanity.veryEarlyP75), true);
    expect(huntSanity.isHuntPosible(HuntSanity.earlyP50), false);
    expect(huntSanity.isHuntPosible(HuntSanity.normalP50), false);
    expect(huntSanity.isHuntPosible(HuntSanity.lateM40), false);

    huntSanity = HuntSanity.earlyP50;
    expect(huntSanity.isHuntPosible(HuntSanity.veryEarlyP75), true);
    expect(huntSanity.isHuntPosible(HuntSanity.earlyP50), true);
    expect(huntSanity.isHuntPosible(HuntSanity.normalP50), false);
    expect(huntSanity.isHuntPosible(HuntSanity.lateM40), false);

    huntSanity = HuntSanity.normalP50;
    expect(huntSanity.isHuntPosible(HuntSanity.veryEarlyP75), true);
    expect(huntSanity.isHuntPosible(HuntSanity.earlyP50), true);
    expect(huntSanity.isHuntPosible(HuntSanity.normalP50), true);
    expect(huntSanity.isHuntPosible(HuntSanity.lateM40), false);

    huntSanity = HuntSanity.lateM40;
    expect(huntSanity.isHuntPosible(HuntSanity.veryEarlyP75), true);
    expect(huntSanity.isHuntPosible(HuntSanity.earlyP50), true);
    expect(huntSanity.isHuntPosible(HuntSanity.normalP50), true);
    expect(huntSanity.isHuntPosible(HuntSanity.lateM40), true);
  });
}
