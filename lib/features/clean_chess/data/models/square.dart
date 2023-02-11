import 'package:clean_chess/features/clean_chess/data/models/piece.dart';

class Square {
  String coord;
  Piece? piece;

  Square({required this.coord, this.piece});
}
