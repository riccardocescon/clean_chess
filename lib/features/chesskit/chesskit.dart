import 'package:dartchess/dartchess.dart';
import 'package:dartz/dartz.dart' as dartz;
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

class ChessKit {
  /// The current state of the game
  late Chess _chess;

  /// Getter for the pieces on the board
  List<Tuple2<Square, Piece>> get pieces => _chess.board.pieces.toList();

  /// Getter for the current turn
  Side get turn => _chess.turn;

  /// Getter for the current FEN
  String get fen => _chess.fen;

  bool get isCheckmate => _chess.isCheckmate;
  bool get isStalemate => _chess.isStalemate;
  bool get isInsufficientMaterial => _chess.isInsufficientMaterial;
  bool get isGameOver => _chess.isGameOver;
  bool get gameEnded =>
      isCheckmate || isStalemate || isInsufficientMaterial || isGameOver;

  Outcome get outcome => _chess.outcome!;

  ChessKit(Setup setup) : _chess = Chess.fromSetup(setup);

  /// Moves a piece on the board and returns the new state of the game
  /// Returns a [ChesskitFailure] if the move is invalid
  /// Returns a [Chess] object if the move is valid
  dartz.Either<ChesskitFailure, Chess> move(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    if (!_isValidMove(rawUciMove)) {
      return const dartz.Left(InvalidMoveFailure());
    }

    _chess = _chess.play(move!) as Chess;

    return dartz.Right(_chess);
  }

  /// Checks if the move is valid
  bool _isValidMove(String rawUciMove) {
    final move = Move.fromUci(rawUciMove);
    return move != null && _chess.isLegal(move);
  }

  /// Get the legal moves for the given [square]
  List<Square> getLegalMoves(Square square) {
    // Assert that the square is not empty
    final piece = _chess.board.pieceAt(square);
    if (piece == null) {
      return [];
    }

    // Get the legal moves for the piece
    List<Square> legalMoves = [];
    _chess.legalMoves.where((key, value) => key == square).forEach(
      (key, value) {
        legalMoves.addAll(value.squares.toList());
      },
    );

    return legalMoves;
  }

  /// Checks if the move is a promotion
  bool isPromotion(NormalMove move) {
    // Assert that the move is a normal move
    if (move.uci.length != 4) return false;

    // Assert that the move is a pawn move
    final piece = _chess.board.pieceAt(move.from);
    if (piece != Piece.whitePawn && piece != Piece.blackPawn) return false;

    // Assert that the pawn has reached the backrank
    if (SquareSet.backrankOf(Side.white).squares.contains(move.to)) return true;
    if (SquareSet.backrankOf(Side.black).squares.contains(move.to)) return true;

    // If none of the above conditions are met, it's not a promotion
    return false;
  }
}
