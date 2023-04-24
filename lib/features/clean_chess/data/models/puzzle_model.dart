class PuzzleModel {
  late final String puzzleId;
  late final String fen;
  late final List<String> moves;
  late final int rating;
  late final int ratingDeviation;
  late final int popularity;
  late final int nbPlayers;
  late final String themes;
  late final String gameUrl;
  late final String openingTags;

  PuzzleModel.fromDB(List<dynamic> data) {
    puzzleId = data[0].toString();
    fen = data[1];
    moves = data[2].split(' ');
    rating = data[3];
    ratingDeviation = data[4];
    popularity = data[5];
    nbPlayers = data[6];
    themes = data[7];
    gameUrl = data[8];
    openingTags = data[9];
  }
}
