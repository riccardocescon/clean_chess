abstract class Failure {
  final String message;
  Failure(this.message);
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
