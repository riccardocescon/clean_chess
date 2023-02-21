import 'package:clean_chess/chess/abstractions/piece.dart';
import 'package:clean_chess/chess/error/failures.dart';
import 'package:clean_chess/chess/models/pieces.dart';
import 'package:clean_chess/core/utilities/enums.dart';
import 'package:dartz/dartz.dart';

class Empty {
  const Empty();
}

Either<Failure, Piece> getPieceFromFen(String letter) {
  final pieces = <String, Piece>{
    'P': Pawn(PieceColor.white),
    'p': Pawn(PieceColor.black),
    'N': Knight(PieceColor.white),
    'n': Knight(PieceColor.black),
    'B': Bishop(PieceColor.white),
    'b': Bishop(PieceColor.black),
    'R': Rook(PieceColor.white),
    'r': Rook(PieceColor.black),
    'Q': Queen(PieceColor.white),
    'q': Queen(PieceColor.black),
    'K': King(PieceColor.white),
    'k': King(PieceColor.black),
  };

  if (pieces.containsKey(letter)) {
    return Right(pieces[letter]!);
  } else {
    return Left(PieceFenInvalidFailure('Invalid piece $letter'));
  }
}
