mixin TrackableMove {
  int totalMoves = 0;

  bool get hasMoved => totalMoves > 0;
}
