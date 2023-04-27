import 'package:cleanchess/core/utilities/parser.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class PuzzleModel {
  late final String puzzleId;
  late final String fen;
  late final List<String> moves;
  late final int rating;
  late final int ratingDeviation;
  late final int popularity;
  late final int nbPlayers;
  late final String themes;
  late final String gameUrl;
  late final String openingTags;

  PuzzleModel.fromDB(List<dynamic> data) {
    puzzleId = data[0].toString();
    fen = data[1];
    moves = data[2].split(' ');
    rating = data[3];
    ratingDeviation = data[4];
    popularity = data[5];
    nbPlayers = data[6];
    themes = data[7];
    gameUrl = data[8];
    openingTags = data[9];
  }

  PuzzleModel.fromLichessPuzzle(LichessPuzzle puzzle) {
    // TODO: for the Not Given values, you should get the puzzle by it's id
    // for the moment it is not needed
    puzzleId = puzzle.game?.id ?? '<Unknown>';
    fen = parsePGN(puzzle.game!.pgn!).item1;
    moves = puzzle.puzzle!.solution!.toList();
    rating = puzzle.puzzle?.rating ?? 0;
    ratingDeviation = 0; // Not given
    popularity = 0; // Not given
    nbPlayers = puzzle.puzzle?.plays ?? 0; // Not given
    themes = puzzle.puzzle?.themes?.join(' ') ?? '';
    gameUrl = ''; // Not given
    openingTags = ''; // Not given
  }
}
