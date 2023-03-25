import 'package:cleanchess/features/clean_chess/presentation/widgets/chart.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/stats_game_card.dart';
import 'package:flutter/material.dart';

const backgroundColor = Color.fromARGB(225, 17, 17, 17);
//
const List<String> gamemode = [
  "Bullet",
  "Blitz",
  "Rapid",
  "Classical",
  "Daily",
  "Puzzles",
];

int index = 0;

@override
class StatsPage extends StatelessWidget {
  const StatsPage({
    super.key,
    required this.numberOfGames,
  });

  final int numberOfGames;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: _appbar(context),
        body: _body(),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      shadowColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _body() {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
      ),
      child: ListView(
        children: [
          _chart(),
          _gamesPlayed(),
        ],
      ),
    );
  }

  Widget _chart() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 35),
      child: Column(
        children: [
          topTitleWidgets(),
          const SizedBox(height: 150, child: Chart()),
          bottomTitleWidgets(),
        ],
      ),
    );
  }

//#region Chart widgets

  Widget topTitleWidgets() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                if (index > 0) {
                  index--;
                } else {
                  index = 5;
                }
              },
            ),
            Text(gamemode[index],
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                )),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                if (index < 5) {
                  index++;
                } else {
                  index = 0;
                }
              },
            ),
          ],
        ),
        Column(
          children: [
            Text("$elo",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$resultElo",
                    style: const TextStyle(fontSize: 15, color: Colors.green)),
                const Icon(Icons.arrow_drop_up, color: Colors.green),
              ],
            ), //TODO color
          ],
        ),
      ],
    );
  }

  Widget bottomTitleWidgets() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text("21 April"),
          Text("21 May"), //TODO date
        ],
      ),
    );
  }

  Widget _gamesPlayed() {
    return Column(
      children: [
        _gamesPlayedText(),
        ListBody(
          children: const [
            //FIXME
            GamesCard(
              gainedElo: 4,
              gainedEloOpponent: -6,
              gameDate: "Yesterday 22:05",
              gameMode: "Standart",
              gameTime: "3 + 0",
              openingName: "Scandavian Defense",
              opponentRating: 1324,
              opponentname: "alexrintt",
              rating: 1233,
              result: "White timed out, black is victorious",
              username: "hardal",
            ),
            GamesCard(
              gainedElo: 4,
              gainedEloOpponent: -6,
              gameDate: "Yesterday 22:05",
              gameMode: "Standart",
              gameTime: "3 + 0",
              openingName: "Scandavian Defense",
              opponentRating: 1324,
              opponentname: "alexrintt",
              rating: 1233,
              result: "White timed out, black is victorious",
              username: "hardal",
            ),
            GamesCard(
              gainedElo: 4,
              gainedEloOpponent: -6,
              gameDate: "Yesterday 22:05",
              gameMode: "Standart",
              gameTime: "3 + 0",
              openingName: "Scandavian Defense",
              opponentRating: 1324,
              opponentname: "alexrintt",
              rating: 1233,
              result: "White timed out, black is victorious",
              username: "hardal",
            ),
          ],
        ),
      ], //Test
    );
  }

  Widget _gamesPlayedText() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, bottom: 20),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.circle,
              color: Colors.pink,
              size: 10,
            ),
          ),
          Text("$numberOfGames ${gamemode[index]} Games",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              )),
        ],
      ),
    );
  }
}
