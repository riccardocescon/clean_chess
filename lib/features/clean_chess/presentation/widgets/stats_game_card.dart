import 'package:flutter/material.dart';

import 'chessboard.dart';

Color? gainedEloColor;
Color? gainedEloOpponentColor;
bool isStarred = true;

class GamesCard extends StatelessWidget {
  const GamesCard({
    super.key,
    required this.openingName,
    required this.gameTime,
    required this.gameDate,
    required this.username,
    required this.opponentname,
    required this.rating,
    required this.opponentRating,
    required this.gainedElo,
    required this.gainedEloOpponent,
    required this.result,
    required this.gameMode,
  });

  final String openingName; // = "The Sicilian Defense"

  final String gameTime; // = "10 + 0"

  final String gameDate; // = "yesterday at 13:06"

  final String gameMode; // = "Standart"

  final String result; // = "White time out, black is victorious."

  final String username;

  final String opponentname;

  final int rating;

  final int opponentRating;

  final int gainedElo;

  final int gainedEloOpponent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return InkWell(
      onTap: () => clickedOnPlayedGame(),
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: const Color.fromARGB(225, 23, 23, 23)),
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _boardAndOpening(context),
                _gameInfo(context),
                _starShareResult(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _boardAndOpening(BuildContext context) {
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
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.bodySmall?.fontSize),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gameInfo(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15),
        child: Column(
          children: [
            Text("$gameTime $gameMode",
                style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.bodyMedium?.fontSize)),
            Text(gameDate,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize)),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Text("$username  $opponentname"),
            ),
            _userAndOpponent(context),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                result,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
                    color: Colors.green),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _userAndOpponent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("$rating",
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize)),
        Text(
          " +$gainedElo",
          style: TextStyle(
            color: Colors.green,
            fontSize: Theme.of(context).textTheme.bodySmall?.fontSize,
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
        Text(
          "$opponentRating",
          style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodyMedium?.fontSize),
        ),
        Text(
          " $gainedEloOpponent",
          style: TextStyle(
              color: Colors.red,
              fontSize: Theme.of(context).textTheme.bodySmall?.fontSize),
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
}
