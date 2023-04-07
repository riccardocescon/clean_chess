import 'package:equatable/equatable.dart';

abstract class Failure with EquatableMixin implements Exception {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure(String message) : super(message);
}

class PieceNotFoundOnCellFailure extends Failure {
  const PieceNotFoundOnCellFailure(String message) : super(message);
}

class PieceFenInvalidFailure extends Failure {
  const PieceFenInvalidFailure(String message) : super(message);
}

class InvalidFen extends Failure {
  const InvalidFen() : super("Invalid FEN");
}

class CellNotFoundOnBoard extends Failure {
  const CellNotFoundOnBoard(String message) : super(message);
}

class UnexpectedPieceType extends Failure {
  const UnexpectedPieceType(String message) : super(message);
}

class InvalidPlayerTurnFailure extends Failure {
  const InvalidPlayerTurnFailure() : super("Invalid player turn");
}

class InvalidMoveFailure extends Failure {
  const InvalidMoveFailure(String message) : super(message);
}

class NoPreviousMoveFailure extends Failure {
  const NoPreviousMoveFailure() : super("No previous move");
}

class NoNextMoveFailure extends Failure {
  const NoNextMoveFailure() : super("No next move");
}

class InvalidMoveIndexFailure extends Failure {
  const InvalidMoveIndexFailure(String message) : super(message);
}

class CannotMoveOnPreviousMoveFailure extends Failure {
  const CannotMoveOnPreviousMoveFailure()
      : super("Cannot move on previous move");
}

class CannotMoveWhileInCheckFailure extends Failure {
  const CannotMoveWhileInCheckFailure() : super("Cannot move while in check");
}

class CannotMoveCreatingCheckFailure extends Failure {
  const CannotMoveCreatingCheckFailure() : super("Cannot move creating check");
}

class LichessOAuthFailure extends Failure {
  const LichessOAuthFailure(String message) : super(message);
}

class LichessOAuthCancelled extends Failure {
  const LichessOAuthCancelled() : super("Lichess OAuth Cancelled by user");
}

class NoAccessTokenFailure extends Failure {
  const NoAccessTokenFailure() : super("No access token");
}
