abstract class Failure {
  final String message;
  const Failure(this.message);
}

class IllegalMoveFailure extends Failure {
  const IllegalMoveFailure(String message) : super(message);
}
