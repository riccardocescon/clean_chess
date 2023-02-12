import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/features/clean_chess/data/models/piece.dart';

class Square {
  String coord;
  Piece? piece;
  int whiteControl = 0;
  int blackControl = 0;

  Square({required this.coord, this.piece});

  bool isControlledBy(PieceColor color) =>
      color == PieceColor.white ? whiteControl > 0 : blackControl > 0;
}
