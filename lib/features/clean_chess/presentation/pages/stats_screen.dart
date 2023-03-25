import 'package:cleanchess/features/clean_chess/presentation/widgets/chart.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:flutter/material.dart';

const backgroundColor = Color.fromARGB(225, 17, 17, 17);
//
List<String> gamemode = [
  "Bullet",
  "Blitz",
  "Rapid",
  "Classical",
  "Daily",
  "Puzzles",
];

int index = 0;
int numberOfGames = 54;
String openingName = "The Sicilian Defense";
String gameTime = "10 + 0";
String gameDate = "yesterday at 13:06";
String username = "hardal";
String opponentname = "alexrintt";
String rating = "1322";
String opponentRating = "1296";
int gainedElo = 6;
int gainedEloOpponent = -4;
String result = "White time out, black is victorious.";
String gameMode = "Standart";
bool isStarred = true;
Color? gainedEloColor;
Color? gainedEloOpponentColor;

@override
class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

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
        Text("21 May"),
      ],
    ),
  );
}

//#endregion

Widget _gamesPlayed() {
  return Column(
    children: [
      _gamesPlayedText(),
      ListBody(
        children: [_gamesPlayedCard(), _gamesPlayedCard(), _gamesPlayedCard()],
      ),
    ],
  );
}

//#region Played Games
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

Widget _gamesPlayedCard() {
  return InkWell(
    onTap: () => clickedOnPlayedGame(),
    child: Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Container(
        decoration: ShapeDecoration(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: const Color.fromARGB(225, 23, 23, 23)),
        height: 180,
        width: 400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _boardAndOpening(),
            _gameInfo(),
            _starShareResult(),
          ],
        ),
      ),
    ),
  );
}

Widget _boardAndOpening() {
  return Padding(
    padding: const EdgeInsets.only(left: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 120,
          width: 120,
          child: AspectRatio(
            aspectRatio: 1,
            child: Chessboard(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            openingName,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    ),
  );
}

Widget _gameInfo() {
  return Flexible(
    child: Padding(
      padding: const EdgeInsets.only(top: 15, left: 15),
      child: Column(
        children: [
          Text("$gameTime $gameMode"),
          Text(gameDate, style: const TextStyle(fontSize: 10)),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text("$username  $opponentname"),
          ),
          _userAndOpponent(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 8, color: Colors.green),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _userAndOpponent() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(rating),
      Text(
        " +$gainedElo",
        style: const TextStyle(
          color: Colors.green,
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Image(
          image: AssetImage("assets/icons/swords.png"),
          color: Colors.white,
          width: 18,
          height: 18,
        ),
      ),
      Text(opponentRating),
      Text(
        " $gainedEloOpponent",
        style: const TextStyle(color: Colors.red),
      ),
    ],
  );
}

Widget _starShareResult() {
  return Column(
    children: [
      Row(
        children: [
          InkWell(
              onTap: () => shareButtonPressed(),
              child: const Icon(Icons.share, color: Colors.green)),
          IconButton(
            onPressed: () => starButtonPressed(),
            icon: Icon(isStarred ? Icons.star : Icons.star_border),
            color: isStarred ? Colors.amber : Colors.white,
          ),
        ],
      ),
      const Padding(
        padding: EdgeInsets.only(top: 40, right: 10),
        child: Icon(
          Icons.handshake,
          size: 60,
        ),
      ),
    ],
  );
}
//#endregion

//Gets called when the star button is pressed
void starButtonPressed() {
  isStarred = !isStarred;
}

//Gets called when the share button is pressed
void shareButtonPressed() {}

//Gets called when a played game is clicked
void clickedOnPlayedGame() {
  //route to game screen
}

void styleELo() {
  if (gainedElo < 0) {
    gainedEloColor = Colors.green;
  } else if (gainedElo == 0) {
    gainedEloColor = Colors.white;
  } else {
    gainedEloColor = Colors.red;
  }
  //Same for opponent

  if (gainedEloOpponent < 0) {
    gainedEloColor = Colors.green;
  } else if (gainedEloOpponent == 0) {
    gainedEloColor = Colors.white;
  } else {
    gainedEloOpponentColor = Colors.red;
  }
}
