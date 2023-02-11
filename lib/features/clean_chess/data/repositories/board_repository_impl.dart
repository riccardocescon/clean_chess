import 'package:clean_chess/features/clean_chess/data/models/piece.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/piece_selected_params.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:clean_chess/core/error/failures.dart';
import 'package:clean_chess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_chess/core/utilities/extensions.dart';

class BoardRepositoryImpl implements BoardRepository {
  @override
  Either<Failure, Iterable<Square>> pieceSelected(
    PieceSelectedParams params,
  ) {
    final board = params.board;
    final square = board.squares.expand((element) => element).firstWhere(
          (square) => square.coord == params.squareCoord,
        );
    final piece = square.piece!;
    if (piece is Pawn) {
      final forwardCell = board.squares.offsetSquare(
        square.coord,
        0,
        1,
        // piece.color == Color.white ? 1 : -1,
      );

      if (forwardCell == null) {
        return const Left(
          IllegalMoveFailure(
              "Cannot move Pawn forward if it's at the end of the board"),
        );
      }

      if (forwardCell.piece != null) {
        return const Left(
          IllegalMoveFailure(
            "Cannot move Pawn forward if there is a piece in front of it",
          ),
        );
      }

      return Right([forwardCell]);
    }

    throw UnimplementedError();
  }
}
