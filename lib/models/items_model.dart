import 'package:flutter_phasmohelper/database/database.dart';

class ItemsModel {
  ItemsModel({
    required this.name,
    required this.description,
  });

  final Map<String, String> name;
  final Map<String, Map<String, List<String>>> description;
}

extension DatabaseItemsExtension on Database {
  static List<ItemsModel> itemsList = [
    ItemsModel(name: {
      'pl': 'Małpia łapał',
      'en': 'Pumpkins'
    }, description: {
      'pl': {
        'I wish to see the ghost': [
          '+ Duch pojawia się w swojeje obecnej lokalizacji',
          '- Po zakończeniu wydarzenia rozpocznie sie polowanie, a wzrok graczas zostanie przyciemniony na czas trwania wydarzenia i polowania'
        ],
        'I wish for Activity': [
          '+ Dubluje jakąkolwiek aktywność ducha przez 2 minuty, czyli interakcje, wędrowanie i umiejętności',
          '- Niszczy bezpieczniki i blokuje wyjście z mapy na 2 minuty'
        ],
        'I wish for sanity': [
          "+ Ustawia średnią psychikę drużyny na 50%",
          "- Zmienia ulubiony pokój ducha na inny",
          "- Zwiększa spadek Sanity o 50% dla całej drużyny",
          "Uwaga: Te życzenie nadpisuje słabość Goryo. Oznacza to, że mimo tego, że Goryo nie może sam zmienić swojego pokoju, to MOŻE to zrobić po użyciu tego życzenia"
        ],
        'I wish the ghost was trapped': [
          "+ Teleportuje ducha do jego pokoju i zamyka wszystkie drzwi do tego pokoju na minutę",
          "+ Duch nie może huntować, wędrować lub używać swoich umiejętności gdy jest zamknięty w swoim pokoju",
          "- Blokuje wszystkie drzwi do pokoju, gdzie znajduje się gracz, który wypowiedział te życzenie na minutę",
          "- Duch odblokuje wszystkie drzwi po minucie i rozpocznie hunta",
          "- 25% szansa na to, żeby drzwi odblokowały się PO okresie ochronnym"
        ],
        'I wish for life. / I wish to revive my friend': [
          "+ Wskrzesza martwego gracza",
          "- 50% szans na śmierć osoby, która użyła tego życzenia"
        ],
        'I wish to be safe': [
          "+ Odblokowuje najbliższą kryjówkę",
          "- Niszczy światła w pokoju",
          "- Duch może słyszeć i wykrywać ekwipunek gracza, który użył tego życzenia podczas huntów przez całą mapę do końca rundy",
          "Uwaga: To może być użyte dla Twojej korzyści, żeby zmusić ducha, żeby przyszedł do bezpieczniejszego miejsca do zrobienia zadań związanych z huntem."
        ],
        'I wish to leave': [
          "+ Odblokowuje wszystkie drzwi wejściowe w każdym czasie, także podczas hunta.",
          "- Natychmiast blokuje Ci możliwość poruszania się, po czym przez 5 sekund powoli przywraca prędkość chodzenia",
          "- Zmniejsza wzrok gracza, który wypowiedział te życzenie na 5 sekund"
        ],
        'I wish for knowledge.': [
          '+ Usuwa 1 niepoprawny dowód i powiązane z nim duchy z Twojego dziennika zmniejszając listę Twoich możliwych wyborów',
          "- Rozpoczyna hunta niedaleko gracza",
          "- Do końca rundy, gracz, który wypowiedział te życzenie będzie miał zmniejszony wzrok i stłumiony dźwięk",
          'Uwaga: Śmierć zresetuje wzrok i dźwięk do normalności, i pozostanie normalny po wskrzeszeniu.'
        ],
        'I wish for Anything': [
          '+- Nie możesz się zdecydować na życzenie? Pozwól Łapie zdecydować za Ciebie. Życzenie o cokolwiek przyzna Ci jeden z pozostałych (nieużytych) życzeń w tej rundzie',
          'Uwaga: Mimo tego, że możesz tego życzenia użyć więcej niż raz, nie przyzna Ci życzenia, które zostało już użyte w tej rundzie'
        ]
      },
      'en': {
        'I wish to see the ghost': [
          '+ The ghost appears in its current location',
          '- After the event ends, a hunt will start, and the player’s vision will be dimmed for the duration of the event and the hunt'
        ],
        'I wish for Activity': [
          '+ Doubles any ghost activity for 2 minutes, including interactions, wandering, and abilities',
          '- Destroys fuses and blocks the exit from the map for 2 minutes'
        ],
        'I wish for sanity': [
          "+ Sets the team's average sanity to 50%",
          "- Changes the ghost's favorite room to another",
          "- Increases sanity loss by 50% for the entire team",
          "Note: This wish overrides Goryo's weakness. This means that although Goryo cannot change its room by itself, it CAN do so after this wish is used"
        ],
        'I wish the ghost was trapped': [
          "+ Teleports the ghost to its room and locks all doors to that room for one minute",
          "+ The ghost cannot hunt, wander, or use its abilities while trapped in its room",
          "- Blocks all doors to the room where the player who made this wish is for one minute",
          "- The ghost will unlock all doors after one minute and start a hunt",
          "- 25% chance for the doors to unlock AFTER the grace period"
        ],
        'I wish for life. / I wish to revive my friend': [
          "+ Revives a dead player",
          "- 50% chance of death for the person who made this wish"
        ],
        'I wish to be safe': [
          "+ Unlocks the nearest hiding spot",
          "- Destroys lights in the room",
          "- The ghost can hear and detect the equipment of the player who used this wish during hunts across the map until the end of the round",
          "Note: This can be used to your advantage to force the ghost to come to a safer place to complete hunting-related tasks."
        ],
        'I wish to leave': [
          "+ Unlocks all entrance doors at any time, even during a hunt.",
          "- Immediately blocks your ability to move, then slowly restores walking speed over 5 seconds",
          "- Reduces the vision of the player who made this wish for 5 seconds"
        ],
        'I wish for knowledge.': [
          '+ Removes 1 incorrect evidence and associated ghosts from your journal, reducing your list of possible choices',
          "- Starts a hunt near the player",
          "- Until the end of the round, the player who made this wish will have reduced vision and muffled sound",
          'Note: Death will reset vision and sound to normal, and will remain normal after revival.'
        ],
        'I wish for Anything': [
          '+- Can’t decide on a wish? Let the Hand decide for you. Wishing for anything will grant you one of the remaining (unused) wishes in this round',
          'Note: Although you can use this wish more than once, it will not grant you a wish that has already been used in this round'
        ]
      }
    }),
    ItemsModel(
      name: {'pl': 'Pozytywka', 'en': 'Positive'},
      description: {
        'pl': {
          'info': [
            'Aktywacja pozytywki w zasięgu 5m od ducha spowoduje ghost eventa, w którym duch będzie szedł w kierunku pozytywki. W momencie gdy duch dojdzie do pozytywki, rozpocznie się przeklęty hunt.'
          ],
          'Powody uzycia': [
            'Znalezienie ducha',
            'Spadek zdrowia psychicznego',
            'Wywołanie ghost eventu',
            'Rozpoczęcie hunta',
            'Zdjęcie dla dodatkowych pieniędzy'
          ],
          'Koszt': [
            'Gdy znajdujesz się blisko pozytywki, gdy gra to Twoje zdrowie psychiczne będzie spadać o 2.5% na sekundę'
          ],
          'Ciekawostki': [
            'Rzucenie pozytywką ją uszkodzi, od razu powodując hunta',
            'Możesz podejść do ducha o wiele bliżej bez powodowania ghost eventu jeśli duch to Yokai',
            'Za pomocą jednego użycia pozytywki możesz wykonać większość zadań'
          ]
        },
        'en': {
          'info': [
            'Activating the music box within 5m of the ghost will trigger a ghost event where the ghost will walk toward the music box. Once the ghost reaches the music box, a cursed hunt will begin.'
          ],
          'Reasons for use': [
            'Finding the ghost',
            'Sanity drop',
            'Triggering a ghost event',
            'Starting a hunt',
            'Taking a photo for extra money'
          ],
          'Cost': [
            'When you are close to the music box while playing, your sanity will drop by 2.5% per second'
          ],
          'Trivia': [
            'Throwing the music box will break it, immediately causing a hunt',
            'You can get much closer to the ghost without triggering a ghost event if the ghost is a Yokai',
            'With one use of the music box, you can complete most tasks'
          ]
        }
      },
    ),
    ItemsModel(
      name: {'pl': 'Tablica Ouija', 'en': 'Tablica Ouija'},
      description: {
        'pl': {
          'Powody użycia': [
            "Znalezienie aktualnego położenia ducha",
            "Znalezienie kości",
            "Rozpoczęcie hunta",
            "Spadek zdrowia psychicznego",
            "Sprawdzenie wieku ducha (przydatne w teście na Thaye)",
            "Ogólnikowe określenie aktualnego poziomu zdrowia psychicznego",
            "Zdjęcie przedmiotu, i interakcji dla dodatkowych pieniędzy",
            "Jeśli duch ma EMF 5 to możliwość wywołania EMF 5",
            "Żarty 'Puk puk, kto tam?'"
          ],
          'Koszt': [
            "Where are you? 50% zdrowia psychicznego",
            "Where is the bone? 20%",
            "How old are you? 5%",
            "Do you like groups? 20%",
            "How many people are in this room? 20%",
            "Are you here? 20%",
            "Hide and seek 0%",
            "Pozostałe pytania 5%"
          ],
          'Ciekawostki': [
            "Jeśli zapomnisz powiedzieć 'Goodbye', tablica się spali i rozpocznie się przeklęty hunt",
            "Możesz zrobić zdjęcie każdej odpowiedzi jako zdjęcie Interakcji",
            "Zadanie pytania Hide And Seek rozpocznie odliczanie, po czym rozpocznie się przeklęty hunt",
            "Zapytanie o wiek może pozwolić na identyfikację Thaye",
            "Zadawanie pytań ma szansę na danie dowodu na EMF 5. Może być to przydatne w przypadku duchów takich jak Shade"
          ]
        },
        'en': {
          'Reasons for use': [
            "Finding the ghost's current location",
            "Finding the bone",
            "Starting a hunt",
            "Sanity drop",
            "Checking the ghost's age (useful for the Thaye test)",
            "General assessment of the current sanity level",
            "Taking a photo of an item and interactions for extra money",
            "If the ghost has EMF 5, the possibility of triggering EMF 5",
            "Jokes 'Knock knock, who's there?'"
          ],
          'Cost': [
            "Where are you? 50% sanity",
            "Where is the bone? 20%",
            "How old are you? 5%",
            "Do you like groups? 20%",
            "How many people are in this room? 20%",
            "Are you here? 20%",
            "Hide and seek 0%",
            "Other questions 5%"
          ],
          'Trivia': [
            "If you forget to say 'Goodbye', the board will burn and a cursed hunt will begin",
            "You can take a photo of any response as an Interaction photo",
            "Asking the Hide And Seek question will start a countdown, after which a cursed hunt will begin",
            "Asking about age may allow for identifying a Thaye",
            "Asking questions has a chance to provide evidence for EMF 5. This can be useful for ghosts like Shade"
          ]
        }
      },
    ),
    ItemsModel(
      name: {'pl': 'Krąg Przywołania', 'en': 'Circle of Summoning'},
      description: {
        'pl': {
          'Powody użycia': [
            "Spadek zdrowia psychicznego",
            "Wywołanie ghost eventu",
            "Rozpoczęcie hunta",
            "Zdjęcie ducha",
            "Zdjęcie dla dodatkowych pieniędzy"
          ],
          'Koszt': [
            "Zapalenie świecy zużywa 16% zdrowia psychicznego każdej osoby w pobliżu"
          ],
          'Ciekawostki': [
            "Gdy wszystkie świece zostaną zapalone, duch pojawi się w kręgu",
            "Jeśli masz za mało zdrowia psychicznego, żeby zapalić ostatnią świecę pominie etap ghost eventu i od razu rozpocznie hunta",
            "Jeśli masz za mało zdrowia psychicznego, żeby zapalić którąkolwiek z pierwszych 4 świec, zgasną i nie będziesz w stanie ich zapalić",
            "Jeśli zapalisz krąg podczas hunta, przeteloportuje ducha do kręgu w jego aktualnym stanie"
          ]
        },
        'en': {
          'Reasons for use': [
            "Sanity drop",
            "Triggering a ghost event",
            "Starting a hunt",
            "Taking a photo of the ghost",
            "Taking a photo for extra money"
          ],
          'Cost': [
            "Lighting a candle consumes 16% sanity from each person nearby"
          ],
          'Trivia': [
            "When all the candles are lit, the ghost will appear in the circle",
            "If you have too low sanity to light the last candle, it will skip the ghost event stage and immediately start a hunt",
            "If you have too low sanity to light any of the first four candles, they will extinguish and you will not be able to light them",
            "If you light the circle during a hunt, it will teleport the ghost to the circle in its current state"
          ]
        }
      },
    ),
    ItemsModel(
      name: {'pl': 'Karty Tarota', 'en': 'Tarot Cards'},
      description: {
        'pl': {
          'Powody użycia': [
            "Spadek zdrowia psychicznego",
            "Wzrost zdrowia psychicznego",
            "Wywołanie ghost eventu",
            "Rozpoczęcie hunta",
            "Zdjęcie ducha",
            "Zdjęcie dla dodatkowych pieniędzy",
            "Zwiększenie aktywności",
            "Uwięzienie ducha",
            "Wskrzeszenie gracza"
          ],
          'Koszt': [
            "The Tower (20%): Podwaja aktywność ducha na 20 sekund",
            "The Wheel of Fortune (20%): Zdobywasz 25% Zdrowia Psychicznego (Gdy spali się na zielono) lub tracisz 25% Zdrowia Psychicznego (Gdy spali się na czerwono)",
            "The Fool (17% lub 100% podczas hunta): Nie robi nic. Technicznie The Fool jest już wyciągnięty i gra losuje 1 z 9 pozostałych kart do pokazania, zanim zmieni się na The Fool",
            "The Devil (10%): Wymusza Ghost Event",
            "Death (10%): Wymusza hunt",
            "The Hermit (10%): Przenosi ducha do jego pokoju i blokuje go w nim na minutę",
            "The Sun (5%): Podnosi Twój poziom zdrowia psychicznego do 100%",
            "The Moon (5%): Obniża Twój poziom zdrowia psychicznego do 0%",
            "The High Priestess (2%): Wskrzesza martwego gracza. Jeśli nie żyje kilka osób, wskrzesi losowego gracza. Jeśli wszyscy żyją, to od razu wskrzesi następną osobę, która umrze",
            "The Hanged Man (1%): Natychmiastowo Cię zabija"
          ]
        },
        'en': {
          'Reasons for use': [
            "Sanity drop",
            "Sanity increase",
            "Triggering a ghost event",
            "Starting a hunt",
            "Taking a photo of the ghost",
            "Taking a photo for extra money",
            "Increasing activity",
            "Trapping the ghost",
            "Reviving a player"
          ],
          'Cost': [
            "The Tower (20%): Doubles the ghost's activity for 20 seconds",
            "The Wheel of Fortune (20%): Gain 25% Sanity (when it burns green) or lose 25% Sanity (when it burns red)",
            "The Fool (17% or 100% during a hunt): Does nothing. Technically, The Fool is already drawn and the game draws 1 of the 9 remaining cards to show before changing to The Fool",
            "The Devil (10%): Forces a Ghost Event",
            "Death (10%): Forces a hunt",
            "The Hermit (10%): Transports the ghost to its room and locks it in for a minute",
            "The Sun (5%): Raises your sanity level to 100%",
            "The Moon (5%): Lowers your sanity level to 0%",
            "The High Priestess (2%): Revives a dead player. If several people are dead, it revives a random player. If all are alive, it immediately revives the next person who dies",
            "The Hanged Man (1%): Instantly kills you"
          ]
        }
      },
    ),
    ItemsModel(
      name: {'pl': 'Lalka Voodoo', 'en': 'Voodoo Doll'},
      description: {
        'pl': {
          'Powody użycia': [
            "Interakcje",
            "Spadek zdrowia psychicznego",
            "Sprawdzenie EMF 5",
            "Zdjęcia dla dodatkowych pieniędzy"
          ],
          'Koszt': [
            "Ukłucie Lalki Voodoo zabiera 5% zdrowia psychicznego (poza ukłuciem w serce)",
            "Ukłucie Lalki Voodoo w serce zabiera 10%",
            "Jeśli masz za mało zdrowia psychicznego, żeby użyć lalki, wszystkie igły zostaną wbite i rozpocznie się przeklęty hunt"
          ]
        },
        'en': {
          'Reasons for use': [
            "Interactions",
            "Sanity drop",
            "Checking for EMF 5",
            "Photos for extra money"
          ],
          'Cost': [
            "Stabbing the Voodoo Doll takes 5% sanity (except for stabbing the heart)",
            "Stabbing the Voodoo Doll in the heart takes 10%",
            "If you have too little sanity to use the doll, all needles will be stabbed and a cursed hunt will begin"
          ]
        }
      },
    ),
  ];
}
