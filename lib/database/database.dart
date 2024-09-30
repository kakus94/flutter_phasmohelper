import 'package:flutter_phasmohelper/models/enums.dart';
import 'package:flutter_phasmohelper/models/ghost/ghost_model.dart';

class Database {
  static List<GhostModel> ghostList = [
    GhostModel(
      name: 'Spirit',
      evidence: [Evidence.ghostWriting, Evidence.spiritBox, Evidence.emf5],
      evidenceRequired: null,
      huntSanity: HuntSanity.normalP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.no,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': "info", 'en': "info"},
          description: [
            {
              'pl':
                  "nie może rozpocząć polowania po użyciu kadzidła przez 180s/3min",
              'en': "cannot start hunting after using incense for 180s/3min"
            }
          ],
        )
      ],
    ),
    GhostModel(
      name: 'Wraith',
      evidence: [Evidence.dots, Evidence.spiritBox, Evidence.emf5],
      evidenceRequired: null,
      huntSanity: HuntSanity.normalP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.easy,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "NIGDY nie wdepnie w sól, a co za tym idzie nigdy nie spowolni go sól na 3 poziomie",
              'en':
                  "He will NEVER step on salt, and therefore will never be slowed down by salt at level 3"
            },
            {
              'pl':
                  "może teleportować się do losowego gracza, zostawiając przy tym EMF 2 lub EMF 5 w miejscu, do którego się teleportował",
              'en':
                  "can teleport to a random player, leaving behind EMF 2 or EMF 5 at the location he teleported to"
            }
          ],
        )
      ],
    ),
    GhostModel(
      name: 'Phantom',
      evidence: [Evidence.spiritBox, Evidence.ultrafilet, Evidence.dots],
      evidenceRequired: null,
      huntSanity: HuntSanity.normalP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.easy,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "zniknie po zrobieniu zdjęcia(również na D.O.T.Sach), event będzie/może trwać dalej po zniknięciu;",
              'en':
                  "It will disappear after taking a photo (also on D.O.T.S.), but the event may continue even after it disappears;"
            },
            {
              'pl': "nie będzie go widać w dzienniku na zdjęciu",
              'en': "It will not be visible in the journal photo"
            },
            {
              'pl': "słabo widoczny podczas polowania - rzadko mruga",
              'en': "Barely visible during hunting – rarely blinks"
            },
            {
              'pl':
                  "gracz będzie tracił 0,5% psychiki na sekundę, gdy patrzy na ducha i jest w zasięgu bicia serca podczas eventu i polowania",
              'en':
                  "The player will lose 0.5% sanity per second when looking at the ghost and within heart beat range during events and hunts"
            },
            {
              'pl':
                  "może przyjść do losowego gracza (roaming - włóczenie się), zostawiając przy tym EMF 2",
              'en': "It can roam to a random player, leaving behind EMF 2"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Poltergeist',
      evidence: [
        Evidence.ghostWriting,
        Evidence.spiritBox,
        Evidence.ultrafilet
      ],
      evidenceRequired: null,
      huntSanity: HuntSanity.normalP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.easy,
      nature: Nature.force,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl': "zwiększona szansa na interakcję z przedmiotami",
              'en': "Increased chance to interact with objects"
            },
            {
              'pl': "rzuca mocno i daleko",
              'en': "Throws objects forcefully and far"
            },
            {
              'pl':
                  "polter-bomba: szansa na wyrzucenie kilku przedmiotów na raz w powietrze, zabierając przy tym 2% psychiki za każdy przedmiot (5 przedmiotów = minus 10%)",
              'en':
                  "Polter-bomb: Chance to throw multiple objects into the air at once, draining 2% sanity per object (5 objects = minus 10%)"
            },
            {
              'pl':
                  "w trakcie polowania ma 100% szans na rzucanie przedmiotami co 0,5s; będzie też rzucał bardzo mocno",
              'en':
                  "During hunting, has a 100% chance to throw objects every 0.5s and will also throw them very forcefully"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Banshie',
      evidence: [Evidence.dots, Evidence.ultrafilet, Evidence.orbs],
      evidenceRequired: null,
      huntSanity: HuntSanity.normalP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.no,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.posibleMultiolayer,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "unikalna odpowiedź na mikrofonie parabolicznym - krzyk (szansa na to = 33%)",
              'en':
                  "Unique response on the parabolic microphone - scream (33% chance)"
            },
            {
              'pl':
                  "będzie gonić jedynie target podczas polowań (reszta graczy może nawet przejść przez ducha i nie umrze)",
              'en':
                  "Will chase only the target during hunts (other players can even walk through the ghost and won't die)"
            },
            {
              'pl':
                  "jeśli target jest poza mapą to polowania są normalne! (każdy może umrzeć)",
              'en':
                  "If the target is off the map, hunts are normal! (anyone can die)"
            },
            {
              'pl':
                  "po śmierci targetu inny gracz go zastępuje(UWAGA! Jeśli w ustawieniach gry jest opcja wydłużenia polowania po śmierci graczy, to Banshee natychmiastowo wybiera kolejną osobę na nowy cel, więc NIE poluje jak normalny duch, co oznacza, że dalej tylko jedna osoba jest zagrożona)",
              'en':
                  "After the target dies, another player becomes the new target (WARNING! If the game settings allow for extended hunts after players die, the Banshee will immediately choose a new target, so it does NOT hunt like a normal ghost, meaning only one person remains at risk)"
            },
            {
              'pl':
                  "target straci 15% psychiki (zamiast 10%) podczas śpiewanego eventu jeśli wejdzie w ducha",
              'en':
                  "The target will lose 15% sanity (instead of 10%) during the singing event if they walk into the ghost"
            },
            {
              'pl':
                  "może przyjść do targetu (roaming - włóczenie się), nie zostawiając przy tym EMF (nie działa jeśli duch i target są na różnych piętrach)",
              'en':
                  "Can roam to the target without leaving EMF (does not work if the ghost and target are on different floors)"
            },
            {
              'pl': "większa szansa, że duch zrobi śpiewany ghost event",
              'en':
                  "Higher chance for the ghost to trigger a singing ghost event"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Jinn',
      evidence: [Evidence.emf5, Evidence.freezing, Evidence.ultrafilet],
      evidenceRequired: null,
      huntSanity: HuntSanity.normalP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.fast,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: Nature.power,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "przyspieszy w trakcie polowania do 2,5m/s gdy zobaczy gracza, który jest dalej niż 3 metry, zwalnia z powrotem do 1,7m/s gdy podejdzie na 3m do gracza (jest to umiejętność, która działa TYLKO gdy bezpieczniki są WŁĄCZONE)",
              'en':
                  "Speeds up to 2.5m/s during hunts when it sees a player more than 3 meters away, slowing back down to 1.7m/s when within 3 meters of the player (this ability ONLY works when the fuse box is ON)"
            },
            {
              'pl':
                  "NIGDY nie wyłączy bezpieczników (UWAGA! jeśli zapalisz za dużo świateł, to wybije bezpieczniki, nie jest to sprawka ducha)",
              'en':
                  "Will NEVER turn off the fuse box (WARNING! If too many lights are on, the fuse box will trip, but this is not caused by the ghost)"
            },
            {
              'pl':
                  "może obniżyć psychikę gracza o 25%, zostawiając przy tym EMF 2 lub EMF 5 na bezpiecznikach",
              'en':
                  "Can drain a player’s sanity by 25%, leaving behind EMF 2 or EMF 5 at the fuse box"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Mara',
      evidence: [Evidence.ghostWriting, Evidence.spiritBox, Evidence.orbs],
      evidenceRequired: null,
      huntSanity: HuntSanity.normalP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.no,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.hard,
      nature: Nature.light,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "poniżej 60% - zgaszone światło; poniżej 40% - zapalone światło (liczy się pozycja przełącznika światła w pokoju, bezpieczniki mogą być wyłączone a gra i tak zaliczy jakby światło było zapalone)",
              'en':
                  "Below 60% - lights off; below 40% - lights on (the position of the light switch in the room counts, even if the fuse box is off, the game will still register the lights as being on)"
            },
            {
              'pl':
                  "będzie unikać pomieszczeń, w których jest zapalone światło (roaming)",
              'en': "Will avoid rooms with lights on (roaming)"
            },
            {
              'pl':
                  "NIGDY nie zapali światła (co głupie - może włączyć bezpieczniki, ale nie światło)",
              'en':
                  "Will NEVER turn on lights (strangely, it can turn on the fuse box but not the lights)"
            },
            {
              'pl':
                  "może natychmiastowo zgasić światło zaraz po tym, gdy gracz je zapali (przerwa między szansą na użycie umiejętności to 10 sekund, nie trzeba spamować przełącznikiem)",
              'en':
                  "Can immediately turn off the light right after a player turns it on (10-second cooldown between ability uses, no need to spam the switch)"
            },
            {
              'pl':
                  "większa szansa na event psujący oświetlenie w danym pomieszczeniu",
              'en':
                  "Higher chance for events that disrupt the lighting in a specific room"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Revenant',
      evidence: [Evidence.ghostWriting, Evidence.freezing, Evidence.orbs],
      evidenceRequired: null,
      huntSanity: HuntSanity.normalP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.slow,
      huntSpeedSee: Speed.fast,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.easy,
      nature: Nature.fast,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "bardzo wolny (1,0m/s) podczas polowania do momentu wykrycia gracza (przyspieszenie do 3,0m/s) (głos, elektroniczne przedmioty, zobaczenie gracza)",
              'en':
                  "Very slow (1.0m/s) during hunts until it detects a player (speeds up to 3.0m/s) (triggered by voice, electronic devices, or seeing the player)"
            },
            {
              'pl':
                  "przyspieszenie trwa do momentu dotarcia przez ducha do miejsca, w którym ostatni raz wykrył gracza",
              'en':
                  "The speed boost lasts until the ghost reaches the location where it last detected the player"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Shade',
      evidence: [Evidence.ghostWriting, Evidence.freezing, Evidence.emf5],
      evidenceRequired: null,
      huntSanity: HuntSanity.lateM40,
      huntSanityPrecent: 35,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.no,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.hard,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "nie rozpocznie polowania w tym samym pokoju, w którym znajduje się gracz",
              'en': "Will not start a hunt in the same room as the player"
            },
            {
              'pl':
                  "nie zrobi eventu w tym samym pokoju, w którym znajduje się gracz",
              'en': "Will not trigger an event in the same room as the player"
            },
            {
              'pl':
                  "nie zrobi interakcji w pokoju z graczem (rzucanie przedmiotami, zapisanie książki, zgaszenie świeczki)",
              'en':
                  "Will not interact in a room with a player (throwing objects, writing in the book, extinguishing a candle)"
            },
            {
              'pl': "tylko on może pojawić się jako cień na pentagramie",
              'en': "Only this ghost can appear as a shadow on the pentagram"
            },
            {
              'pl': "nigdy nie zrobi eventu na 100% psychice",
              'en': "Will never trigger an event when sanity is at 100%"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Demon',
      evidence: [Evidence.ghostWriting, Evidence.freezing, Evidence.ultrafilet],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 70,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.no,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "może rozpocząć polowanie po 60s/1min po użyciu kadzidła (zamiast standardowych 90s/1,5min)",
              'en':
                  "Can start a hunt 60s/1min after using smudge sticks (instead of the standard 90s/1.5min)"
            },
            {
              'pl':
                  "odstęp między polowaniami może wynosić 20s (zamiast standardowych 25s)",
              'en':
                  "The interval between hunts can be 20s (instead of the standard 25s)"
            },
            {
              'pl': "może rozpocząć polowanie na dowolnym poziomie psychiki",
              'en': "Can start a hunt at any sanity level"
            },
            {
              'pl':
                  "krucyfiks ma zwiększone działanie o 50% (tier I - 4,5m; tier II - 6m; tier III - 7,5m)",
              'en':
                  "Crucifix has a 50% increased range of effectiveness (Tier I - 4.5m; Tier II - 6m; Tier III - 7.5m)"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Yurei',
      evidence: [Evidence.dots, Evidence.freezing, Evidence.orbs],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.no,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.hard,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "tylko on może wchodzić w interakcję z drzwiami głównymi poza eventem i polowaniem",
              'en':
                  "Only this ghost can interact with the main door outside of events and hunts"
            },
            {
              'pl':
                  "po użyciu kadzidła nie może opuszczać swojego pokoju przez 90s/1,5min",
              'en':
                  "After using smudge sticks, it cannot leave its room for 90s/1.5min"
            },
            {
              'pl':
                  "może trzasnąć drzwiami (zamknięcie w pełni otworzonych drzwi) i zabrać 15% psychiki",
              'en':
                  "Can slam doors (closing fully open doors) and drain 15% sanity"
            },
            {
              'pl':
                  "podwójne dotknięcie drzwi (najłatwiej rozpoznać po słuchu - dźwięk zamykania drzwi następuje jeden po drugim i się na siebie nakładają)",
              'en':
                  "Double door touch (most easily recognized by sound - door closing sounds occur one after another and overlap)"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Oni',
      evidence: [Evidence.dots, Evidence.freezing, Evidence.emf5],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: Nature.loud,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "zabiera graczowi 20% psychiki podczas eventów, gdy ten wejdzie w ducha (zamiast standardowych 10%)",
              'en':
                  "Drains 20% sanity from the player during events when they enter the ghost (instead of the standard 10%)"
            },
            {
              'pl': "NIGDY nie zrobi eventu z obłokiem i dmuchnięciem",
              'en': "Will NEVER trigger a cloud and breath event"
            },
            {
              'pl':
                  "często mruga - jest bardzo dobrze widoczny podczas polowania",
              'en': "Frequently blinks - is very visible during hunts"
            },
            {
              'pl': "bardzo aktywny w pobliżu graczy",
              'en': "Very active near players"
            },
            {
              'pl':
                  "większa szansa na pojawienie się w pełnym modelu ducha podczas eventów",
              'en': "Higher chance to appear in full ghost model during events"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Yokai',
      evidence: [Evidence.dots, Evidence.spiritBox, Evidence.orbs],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: Nature.power,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "zasięg wykrywania gracza wynosi 2,5m zarówno dla głosu i urządzeń elektronicznych gracza (zamiast standardowych 9m i 7,5m)",
              'en':
                  "Player detection range is 2.5m for both voice and electronic devices (instead of the standard 9m and 7.5m)"
            },
            {
              'pl':
                  "szansa na rozpoczęcie polowania od 80% psychiki gdy w pobliżu są rozmawiający gracze",
              'en':
                  "Chance to start a hunt at 80% sanity when there are talking players nearby"
            },
            {
              'pl': "większa aktywność gdy w pobliżu są rozmawiający gracze",
              'en': "Higher activity when there are talking players nearby"
            },
            {
              'pl':
                  "po użyciu pozytywki pokaże się dopiero w odległości 2,5m od niej (zamiast standardowych 5m)",
              'en':
                  "Will only show up at a distance of 2.5m from the music box after use (instead of the standard 5m)"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Hantu',
      evidence: [Evidence.freezing, Evidence.orbs, Evidence.ultrafilet],
      evidenceRequired: Evidence.freezing,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: Nature.temp,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl': "NIGDY NIE WŁĄCZY bezpieczników.",
              'en': "Will NEVER turn on the fuse box."
            },
            {
              'pl':
                  "widoczny mroźny oddech podczas polowań (TYLKO jeśli bezpieczniki są WYŁĄCZONE).",
              'en':
                  "Visible freezing breath during hunts (ONLY if the fuse box is OFF)."
            },
            {
              'pl': "większa szansa na wyłączenie bezpieczników.",
              'en': "Higher chance of turning off the fuse box."
            },
            {
              'pl':
                  "szybszy w chłodniejszych pomieszczeniach, wolniejszy w cieplejszych - może zmieniać prędkość w trakcie całego polowania.",
              'en':
                  "Faster in cooler rooms, slower in warmer ones - can change speed throughout the hunt."
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Goryo',
      evidence: [Evidence.dots, Evidence.ultrafilet, Evidence.emf5],
      evidenceRequired: Evidence.dots,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 70,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.no,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.hard,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "NIGDY nie zmieni ulubionego pokoju sam z siebie (jedyny przypadek, w którym to zrobi, to po użyciu małpiej łapy i wybraniu życzenia \"I wish for sanity\")",
              'en':
                  "Will NEVER change its favorite room on its own (the only case when it does is after using the monkey's paw and choosing the wish 'I wish for sanity')"
            },
            {
              'pl': "D.O.T.Sy widoczne tylko przez kamerę",
              'en': "D.O.T.S. are visible only through the camera"
            },
            {
              'pl':
                  "nie pojawi się na D.O.T.Sach, gdy w pokoju z duchem jest żywy gracz",
              'en':
                  "Will not appear on D.O.T.S. when there is a living player in the room with the ghost"
            },
            {'pl': "MUSI mieć D.O.T.Sy", 'en': "MUST have D.O.T.S."},
            {
              'pl':
                  "nie roamuje (włóczy się) często i daleko od swojego ulubionego pokoju",
              'en': "Does not roam often and far from its favorite room"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Myling',
      evidence: [Evidence.ghostWriting, Evidence.ultrafilet, Evidence.emf5],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.hard,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl': "wydaje więcej dźwięków na mikrofonie parabolicznym",
              'en': "Makes more sounds on the parabolic microphone"
            },
            {
              'pl':
                  "nie słychać ani jego odgłosów ani kroków z odległości większej niż 12m (zamiast standardowych 20m)",
              'en':
                  "Its sounds and footsteps cannot be heard from a distance greater than 12m (instead of the standard 20m)"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Onryo',
      evidence: [Evidence.spiritBox, Evidence.freezing, Evidence.orbs],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 60,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.no,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.hard,
      nature: Nature.fire,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "spróbuje rozpocząć polowanie po każdej 3 zgaszonej świeczce/zapalniczce",
              'en':
                  "Will attempt to start a hunt after every 3 extinguished candles/lighters"
            },
            {
              'pl':
                  "świeczka/zapalniczka działa jak krucyfiks (świeczka ma większy priorytet zużycia niż krucyfiks, co oznacza, że Onryo najpierw zgasi świeczkę, a dopiero potem może zużyć krucyfiks. UWAGA! świeca ma jedynie 2m zasięgu [promień koła], więc upewnij się, że świece pokrywają się z zasięgiem krucyfiksu)",
              'en':
                  "The candle/lighter acts like a crucifix (the candle has a higher usage priority than the crucifix, meaning the Onryo will extinguish the candle first before it can use the crucifix. NOTE: the candle has only a 2m range [radius], so make sure the candles overlap with the range of the crucifix)"
            },
            {
              'pl':
                  "im więcej graczy umrze, tym bardziej zwiększa się szansa, że zgasi świeczkę/zapalniczkę",
              'en':
                  "The more players die, the higher the chance it will extinguish the candle/lighter"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'The Twins',
      evidence: [Evidence.spiritBox, Evidence.freezing, Evidence.emf5],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.hard,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "może zrobić dwie interakcje w tym samym czasie (w standardowym zasięgu ducha 3m oraz 16m dla drugiego Twinsa)",
              'en':
                  "Can perform two interactions at the same time (within the standard ghost range of 3m and 16m for the second Twin)"
            },
            {
              'pl':
                  "interakcje takie jak: wdepnięcie w sól, aktywowanie czujnika ruchu oraz odpowiedź na spirit boxie odbywa się jedynie w fizycznej lokacji ducha",
              'en':
                  "Interactions such as stepping in salt, activating the motion sensor, and responding on the spirit box occur only in the ghost's physical location"
            },
            {
              'pl':
                  "może rozpocząć polowanie z innego pokoju niż ulubiony pokój ducha (drugi Twins)",
              'en':
                  "Can start a hunt from a different room than the ghost's favorite room (the second Twin)"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Raiju',
      evidence: [Evidence.dots, Evidence.orbs, Evidence.emf5],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.fast,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.easy,
      nature: Nature.power,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "szansa na rozpoczęcie polowania od 65% psychiki gdy w pobliżu WŁĄCZONYCH urządzeń elektronicznych (urządzenia elektroniczne/elektronika = przedmioty z ciężarówki, np. EMF, latarka)",
              'en':
                  "Chance to start a hunt at 65% sanity when near ACTIVE electronic devices (electronic devices = items from the truck, e.g., EMF, flashlight)"
            },
            {
              'pl':
                  "nagle zmienia prędkość gdy wejdzie w zasięg włączonych urządzeń elektronicznych podczas polowania",
              'en':
                  "Suddenly changes speed when entering the range of active electronic devices during a hunt"
            },
            {
              'pl':
                  "zakłóca działanie urządzeń elektronicznych z odległości 15m (zamiast standardowych 10m)",
              'en':
                  "Disrupts the operation of electronic devices from a distance of 15m (instead of the standard 10m)"
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Obake',
      evidence: [Evidence.ultrafilet, Evidence.orbs, Evidence.emf5],
      evidenceRequired: Evidence.ultrafilet,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.easy,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "MUSI mieć Ultrafiolet jako dowód na koszmarze, obłędzie, itp.",
              'en': "MUST have UV as evidence of nightmare, madness, etc."
            },
            {
              'pl':
                  "specjalne odciski UV: sześciopalczasty odcisk dłoni, 2 odciski palców na przełączniku światła, 5 odcisków palców na kratach lub klawiaturze.",
              'en':
                  "Special UV fingerprints: six-fingered handprint, 2 fingerprints on the light switch, 5 fingerprints on vents or keyboard."
            },
            {
              'pl': "25% szans na to, że nie zostawi odcisków po interakcji.",
              'en':
                  "25% chance of not leaving fingerprints after an interaction."
            },
            {
              'pl':
                  "przynajmniej raz w ciągu każdego polowania zmieni model ducha na inny (tej samej płci) z szansą 6.66%.",
              'en':
                  "At least once during each hunt, will change the ghost model to another (of the same gender) with a chance of 6.66%."
            },
            {
              'pl':
                  "szansa na użycie umiejętności powodującej, że odciski UV znikają szybciej.",
              'en':
                  "Chance to use an ability that makes UV fingerprints disappear faster."
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Mimik',
      evidence: [
        Evidence.freezing,
        Evidence.spiritBox,
        Evidence.ultrafilet,
        Evidence.orbs
      ],
      evidenceRequired: null,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 70,
      huntSpeedNoSee: Speed.medium,
      huntSpeedSee: Speed.medium,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "ZAWSZE będą Orby (nawet jeśli poziom trudności ustawiony jest na 0 dowodów, bo Orby są jego umiejętnością, a nie dowodem).",
              'en':
                  "Will ALWAYS have Orbs (even if the difficulty level is set to 0 evidence, because Orbs are its ability, not evidence)."
            },
            {
              'pl':
                  "może naśladować umiejętności wszystkich innych duchów (umiejętności poza polowaniem, szybkość, mruganie).",
              'en':
                  "Can mimic the abilities of all other ghosts (abilities outside of hunting, speed, blinking)."
            },
            {
              'pl':
                  "zmienia rodzaj ducha, którego naśladuje w przedziale od 30s do 2min.",
              'en':
                  "Changes the type of ghost it mimics within a range of 30s to 2min."
            },
            {
              'pl': "prędkość zależy od tego, jakiego ducha obecnie naśladuje.",
              'en': "Speed depends on which ghost it is currently mimicking."
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Moroi',
      evidence: [Evidence.spiritBox, Evidence.ghostWriting, Evidence.freezing],
      evidenceRequired: Evidence.spiritBox,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 50,
      huntSpeedNoSee: Speed.fast,
      huntSpeedSee: Speed.superFast,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "nakłada klątwę na gracza, któremu odpowie na Spirit Boxie lub mikrofonie parabolicznym; klątwa sprawia, że gracz traci psychikę 2 razy szybciej i działa do momentu użycia przedmiotu przywracającego psychikę.",
              'en':
                  "Curses a player who responds on the Spirit Box or parabolic microphone; the curse causes the player to lose sanity twice as fast and lasts until a sanity-restoring item is used."
            },
            {
              'pl':
                  "wolniejszy na wyższym poziomie psychiki, szybszy na niższym poziomie psychiki.",
              'en':
                  "Slower at higher sanity levels, faster at lower sanity levels."
            },
            {
              'pl':
                  "czas ogłuszenia po użyciu kadzidła dłuższy o 50% (7,5s zamiast 5s).",
              'en':
                  "Stun time after using smudge sticks is increased by 50% (7.5s instead of 5s)."
            },
            {
              'pl':
                  "krucyfiks ma zwiększone działanie o 50% (tier I - 4,5m; tier II - 6m; tier III - 7,5m).",
              'en':
                  "Crucifix has a 50% increased range of effectiveness (Tier I - 4.5m; Tier II - 6m; Tier III - 7.5m)."
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Deogen',
      evidence: [Evidence.spiritBox, Evidence.ghostWriting, Evidence.dots],
      evidenceRequired: Evidence.spiritBox,
      huntSanity: HuntSanity.earlyP50,
      huntSanityPrecent: 40,
      huntSpeedNoSee: Speed.superFast,
      huntSpeedSee: Speed.slow,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.easy,
      nature: null,
      infos: [
        InfoModel(
          title: {'pl': 'info', 'en': 'info'},
          description: [
            {
              'pl':
                  "specjalna odpowiedź na Spirit Boxie jeśli stoisz w odległości 1m od ducha",
              'en':
                  "Curses a player who responds on the Spirit Box or parabolic microphone; the curse causes the player to lose sanity twice as fast and lasts until a sanity-restoring item is used."
            },
            {
              'pl': "bardziej widoczny w trakcie polowania",
              'en':
                  "Slower at higher sanity levels, faster at lower sanity levels."
            },
            {
              'pl': "nie można się przed nim schować",
              'en':
                  "Stun time after using smudge sticks is increased by 50% (7.5s instead of 5s)."
            },
            {
              'pl':
                  "bardzo szybko podąża do lokacji najbliższego gracza i zwalnia, gdy już znajdzie się blisko niego(wolniejszy od gracza)",
              'en':
                  "Crucifix has a 50% increased range of effectiveness (Tier I - 4.5m; Tier II - 6m; Tier III - 7.5m)."
            }
          ],
        ),
      ],
    ),
    GhostModel(
      name: 'Thaye',
      evidence: [Evidence.dots, Evidence.ghostWriting, Evidence.orbs],
      evidenceRequired: null,
      huntSanity: HuntSanity.veryEarlyP75,
      huntSanityPrecent: 75,
      huntSpeedNoSee: Speed.fast,
      huntSpeedSee: Speed.fast,
      canRecognizedHunting: CanRecognizedHunting.yes,
      difficultyWithoutEvidence: DifficultyWithoutEvidence.medium,
      nature: null,
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
    ),
  ];
}
