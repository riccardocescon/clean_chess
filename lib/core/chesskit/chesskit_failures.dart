import 'package:equatable/equatable.dart';

abstract class ChesskitFailure with EquatableMixin {
  final String message;
  const ChesskitFailure(this.message);

  @override
  List<Object> get props => [message];
}

class InvalidMoveFailure extends ChesskitFailure {
  const InvalidMoveFailure() : super('Invalid move');
}
