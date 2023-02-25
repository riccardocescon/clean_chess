import 'package:clean_chess/chess/models/fen.dart';

class Puzzle {
  late final String id;
  late final Fen fen;
  late final String name;
  late final String matchLink;

  Puzzle.fromLichessDB(List raw) {
    id = raw[0];
    fen = Fen.fromRaw(raw[1]);
    name = raw[7];
    matchLink = raw[8];
  }
}
