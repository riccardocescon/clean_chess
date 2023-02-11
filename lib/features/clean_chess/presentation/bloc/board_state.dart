import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:equatable/equatable.dart';

abstract class BoardState extends Equatable {
  const BoardState();

  @override
  List<Object> get props => [];
}

class BoardInitial extends BoardState {
  const BoardInitial();
}

class BoardPlaning extends BoardState {
  final Iterable<Square> interactableSquares;
  const BoardPlaning(this.interactableSquares);
}

class BoardMove extends BoardState {
  const BoardMove();
}

class BoardError extends BoardState {
  final String message;
  const BoardError(this.message);
}
