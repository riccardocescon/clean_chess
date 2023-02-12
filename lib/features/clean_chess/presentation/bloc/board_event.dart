import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:equatable/equatable.dart';

abstract class BoardEvent extends Equatable {
  const BoardEvent();

  @override
  List<Object> get props => [];
}

class PieceSelectedEvent extends BoardEvent {
  final String squareCoord;
  const PieceSelectedEvent(this.squareCoord);
}

class PieceMoveEvent extends BoardEvent {
  final Board board;
  final String movement;
  const PieceMoveEvent({required this.board, required this.movement});
}

class SetFenEvent extends BoardEvent {
  final Board board;
  final String fen;
  const SetFenEvent({required this.board, required this.fen});
}
