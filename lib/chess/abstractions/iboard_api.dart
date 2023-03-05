import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/core/utilities/enums.dart';
import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/move.dart';
import 'package:clean_chess/chess/models/tuple.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class IBoardAPI {
  @protected
  @visibleForTesting
  Board board = Board.empty();

  Future<Either<Failure, Board>> move(
    Move move, {
    required Future<Piece> Function() onPawnPromotion,
  });
  Future<Either<Failure, Iterable<Cell>>> planPath(Cell cell);
  Either<Failure, Fen> getFen();
  Either<Failure, Board> fromFen(Fen fen);
  Either<Failure, Tuple<Board, Move?>> previousMove();
  Either<Failure, Tuple<Board, Move?>> nextMove();
  Iterable<Tuple<Piece, int>> getKingThreats(PieceColor color);
}
