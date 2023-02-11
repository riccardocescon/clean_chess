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
