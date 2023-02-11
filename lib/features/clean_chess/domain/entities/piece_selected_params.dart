import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:flutter/material.dart';

@immutable
class PieceSelectedParams {
  final Board board;
  final String squareCoord;

  const PieceSelectedParams({
    required this.board,
    required this.squareCoord,
  });
}
