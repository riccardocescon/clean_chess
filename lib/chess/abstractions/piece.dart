import 'package:clean_chess/core/utilities/enums.dart';

abstract class Piece {
  abstract final String name;
  String get imagePath;
  String get toFen;
  abstract final PieceColor color;
}
