import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/core/utilities/enums.dart';
import 'package:flutter/material.dart';

class Cell {
  final int id;
  final String coord;
  Piece? piece;

  @visibleForTesting
  int whiteControl = 0;

  @visibleForTesting
  int blackControl = 0;

  void addControl(PieceColor color) {
    if (color == PieceColor.white) {
      whiteControl++;
    } else {
      blackControl++;
    }
  }

  void removeControl(PieceColor color) {
    if (color == PieceColor.white) {
      whiteControl--;
      if (whiteControl < 0) throw Exception('whiteControl < 0');
    } else {
      blackControl--;
      if (blackControl < 0) throw Exception('blackControl < 0');
    }
  }

  int getEnemyControl(PieceColor color) {
    if (color == PieceColor.white) {
      return blackControl;
    } else {
      return whiteControl;
    }
  }

  Cell(this.id, this.coord, {this.piece});

  String get column => coord[0];
  int get row => int.parse(coord.substring(1));
}