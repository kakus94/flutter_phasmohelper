import 'package:flutter_phasmohelper/database/database.dart';
import 'package:flutter_phasmohelper/models/enums.dart';
import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';

class GameController {
  List<GhostModel> ghostList = Database.ghostList;
  List<Evidence> findedEvidences = [];
  Speed? norlmalSpeed;
  BehaviorHunt? behaviorHunt;
  HuntSanity? huntSanity;

  void addEvidence(Evidence evidence) {
    findedEvidences.add(evidence);
  }

  void removeEvidence(Evidence evidence) {
    findedEvidences.remove(evidence);
  }

  void clearFindedEvidences() {
    findedEvidences.clear();
  }

  void setNormalSpeed(Speed? speed) {
    norlmalSpeed = speed;
  }

  void setBehaviorHunt(BehaviorHunt? speed) {
    behaviorHunt = speed;
  }

  void setHuntSanity(HuntSanity huntSanity) {
    this.huntSanity = huntSanity;
  }

  List<GhostModel> getGhostList() {
    var x = _getGhostEvidence(ghostList);
    x = _getGhostHuntSanity(x);
    x = _getGhostBehaviorHunt(x);
    x = _getGhostNormalSpeed(x);
    return x;
  }

  List<GhostModel> _getGhostEvidence(List<GhostModel> ghosts) {
    return ghosts.where((e) {
      if (findedEvidences.isEmpty) {
        return true;
      }

      if (findedEvidences.every((evidence) => e.evidence.contains(evidence))) {
        return true;
      }

      return false;
    }).toList();
  }

  List<GhostModel> _getGhostHuntSanity(List<GhostModel> ghosts) {
    return ghosts.where((e) {
      if (huntSanity == null || huntSanity == HuntSanity.none) {
        return true;
      }

      if (e.huntSanity.isHuntPosible(huntSanity!)) {
        return true;
      }

      return false;
    }).toList();
  }

  List<GhostModel> _getGhostBehaviorHunt(List<GhostModel> ghosts) {
    return ghosts.where((e) {
      if (behaviorHunt == null || behaviorHunt == BehaviorHunt.none) {
        return true;
      }

      if (e.behaviorHunt == behaviorHunt) {
        return true;
      }

      return false;
    }).toList();
  }

  List<GhostModel> _getGhostNormalSpeed(List<GhostModel> ghosts) {
    return ghosts.where((e) {
      if (norlmalSpeed == null || norlmalSpeed == Speed.none) {
        return true;
      }

      if (e.huntSpeedNoSee == norlmalSpeed) {
        return true;
      }

      return false;
    }).toList();
  }
}
