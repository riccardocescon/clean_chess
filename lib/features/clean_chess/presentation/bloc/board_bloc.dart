import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/piece_selected_params.dart';
import 'package:clean_chess/features/clean_chess/domain/usecases/piece_move.dart';
import 'package:clean_chess/features/clean_chess/domain/usecases/piece_selected.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_event.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_state.dart';
import 'package:clean_chess/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  Board get board => sl<Board>();

  final PieceSelected pieceSelected;
  final PieceMove pieceMove;

  bool isPlanning = false;

  BoardBloc({
    required this.pieceSelected,
    required this.pieceMove,
  }) : super(const BoardInitial()) {
    on<PieceSelectedEvent>((event, emit) async {
      emit(const BoardLoading());
      if (isPlanning) {
        emit(const BoardInitial());
        isPlanning = false;
        return;
      }

      isPlanning = true;

      final result = await pieceSelected.call(
        PieceSelectedParams(board: board, squareCoord: event.squareCoord),
      );

      result.fold(
        (failure) => emit(BoardError(failure.message)),
        (squares) => emit(BoardPlaning(squares)),
      );
    });
    on<PieceMoveEvent>(
      (event, emit) async {
        isPlanning = false;
        emit(const BoardMove());
        final result = await pieceMove.call(event);
        result.fold(
          (failure) => emit(BoardError(failure.message)),
          (success) {
            emit(const BoardMoved());
          },
        );

        emit(const BoardInitial());
      },
    );

    on<SetFenEvent>((event, emit) async {
      emit(const BoardLoading());
      isPlanning = false;
      event.board.setFen(event.fen);
      emit(const BoardInitial());
    });
  }
}
