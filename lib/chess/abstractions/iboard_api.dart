import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/models/board.dart';
import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/chess/models/fen.dart';
import 'package:clean_chess/chess/models/move.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class IBoardAPI {
  @protected
  Board board = Board.empty();

  Either<Failure, Board> move(Move move);
  Either<Failure, Iterable<Cell>> planPath(Cell cell);
  Fen getFen();
  Either<Failure, Board> fromFen(Fen fen);
  Either<Failure, Board> previousMove();
  Either<Failure, Board> nextMove();
}
