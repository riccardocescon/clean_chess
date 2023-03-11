import 'package:equatable/equatable.dart';

abstract class Failure with EquatableMixin {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure(String message) : super(message);
}

class PieceNotFoundOnCellFailure extends Failure {
  PieceNotFoundOnCellFailure(String message) : super(message);
}

class PieceFenInvalidFailure extends Failure {
  PieceFenInvalidFailure(String message) : super(message);
}

class InvalidFen extends Failure {
  InvalidFen() : super("Invalid FEN");
}

class CellNotFoundOnBoard extends Failure {
  CellNotFoundOnBoard(String message) : super(message);
}

class UnexpectedPieceType extends Failure {
  UnexpectedPieceType(String message) : super(message);
}

class InvalidPlayerTurnFailure extends Failure {
  InvalidPlayerTurnFailure() : super("Invalid player turn");
}

class InvalidMoveFailure extends Failure {
  InvalidMoveFailure(String message) : super(message);
}

class NoPreviousMoveFailure extends Failure {
  NoPreviousMoveFailure() : super("No previous move");
}

class NoNextMoveFailure extends Failure {
  NoNextMoveFailure() : super("No next move");
}

class InvalidMoveIndexFailure extends Failure {
  InvalidMoveIndexFailure(String message) : super(message);
}

class CannotMoveOnPreviousMoveFailure extends Failure {
  CannotMoveOnPreviousMoveFailure() : super("Cannot move on previous move");
}

class CannotMoveWhileInCheckFailure extends Failure {
  CannotMoveWhileInCheckFailure() : super("Cannot move while in check");
}

class CannotMoveCreatingCheckFailure extends Failure {
  CannotMoveCreatingCheckFailure() : super("Cannot move creating check");
}

class LichessOAuthFailure extends Failure {
  LichessOAuthFailure(String message) : super(message);
}

class LichessOAuthCancelled extends Failure {
  LichessOAuthCancelled() : super("Lichess OAuth Cancelled by user");
}

class NoAccessTokenFailure extends Failure {
  NoAccessTokenFailure() : super("No access token");
}
