import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:flutter/material.dart';

abstract class Piece {
  abstract final String name;
  String get imagePath;
  String get toFen;
  abstract final PieceColor color;

  @protected
  int moveTimes = 0;
  int get getMoveTimes => moveTimes;

  void hasMoved() => moveTimes++;

  void setMovesFromFen() => moveTimes = 1000;

  @visibleForTesting
  set setMoveTimes(int value) => moveTimes = value;
}
