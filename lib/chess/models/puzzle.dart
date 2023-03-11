import 'package:cleanchess/chess/models/fen.dart';
import 'package:cleanchess/chess/core/utilities/extensions.dart';

class Puzzle {
  late final String id;
  late final Fen fen;
  late final String name;
  late final String matchLink;

  Puzzle.fromLichessDB(List raw) {
    id = raw[0].toString().padLeft(5, '0');
    fen = Fen.fromRaw(raw[1]);
    name = (raw[7] as String).capitalize();
    matchLink = raw[8];
  }
}
