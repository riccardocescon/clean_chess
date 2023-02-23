import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Cell with EquatableMixin {
  final int id;
  final String coord;
  Piece? piece;

  @visibleForTesting
  int whiteControl = 0;

  @visibleForTesting
  int blackControl = 0;

  int get whitePower => whiteControl;
  int get blackPower => blackControl;

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

  void resetControl() {
    whiteControl = 0;
    blackControl = 0;
  }

  int getEnemyControl(PieceColor color) {
    if (color == PieceColor.white) {
      return blackControl;
    } else {
      return whiteControl;
    }
  }

  Cell(this.id, this.coord, {this.piece});

  Cell.clone(Cell cell)
      : id = cell.id,
        coord = cell.coord,
        piece = cell.piece,
        whiteControl = cell.whiteControl,
        blackControl = cell.blackControl;

  String get column => coord[0];
  int get row => int.parse(coord.substring(1));

  @override
  List<Object?> get props => [id, coord, piece, whiteControl, blackControl];
}
