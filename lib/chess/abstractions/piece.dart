import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:flutter/material.dart';

abstract class Piece {
  abstract final String name;
  String get imagePath;
  String get toFen;
  abstract final PieceColor color;

  int _moveTimes = 0;
  int get moveTimes => _moveTimes;

  void hasMoved() => _moveTimes++;

  @visibleForTesting
  set setMoveTimes(int value) => _moveTimes = value;
}
