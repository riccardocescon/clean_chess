import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/domain/entities/piece_selected_params.dart';
import 'package:clean_chess/features/clean_chess/domain/usecases/piece_selected.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_event.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_state.dart';
import 'package:clean_chess/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardBloc extends Bloc<BoardEvent, BoardState> {
  Board get board => sl<Board>();

  final PieceSelected pieceSelected;

  bool isPlanning = false;

  BoardBloc({
    required this.pieceSelected,
  }) : super(const BoardInitial()) {
    on<PieceSelectedEvent>((event, emit) async {
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
  }
}
