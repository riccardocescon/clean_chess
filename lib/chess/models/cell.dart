import 'package:clean_chess/chess/abstractions/piece.dart';

class Cell {
  final int id;
  final String coord;
  Piece? piece;

  Cell(this.id, this.coord, {this.piece});
}
