import 'package:cleanchess/chess/models/cell.dart';
import 'package:equatable/equatable.dart';

class Move with EquatableMixin {
  final Cell from;
  final Cell to;

  const Move(this.from, this.to);

  Move.clone(Move move)
      : from = Cell.clone(move.from),
        to = Cell.clone(move.to);

  @override
  List<Object?> get props => [from, to];
}
