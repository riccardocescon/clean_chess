import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:clean_chess/features/clean_chess/data/repositories/board_repository_impl.dart';
import 'package:clean_chess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:clean_chess/features/clean_chess/domain/usecases/piece_move.dart';
import 'package:clean_chess/features/clean_chess/domain/usecases/piece_selected.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final List<List<Square>> squares = [];
  const alphabet = 'abcdefgh';
  for (int col = 0; col < 8; col++) {
    final List<Square> rows = [];
    for (int row = 0; row < 8; row++) {
      rows.add(Square(coord: '${alphabet[row]}${8 - col}'));
    }
    squares.add(rows);
  }

  sl.registerSingleton<Board>(Board(
    squares: squares,
    colorTurn: PieceColor.white,
  ));

  // Features - Clean Chess
  // Bloc
  sl.registerFactory<BoardBloc>(() => BoardBloc(
        pieceSelected: sl<PieceSelected>(),
        pieceMove: sl<PieceMove>(),
      ));
  // Use cases
  sl.registerLazySingleton<PieceSelected>(
      () => PieceSelected(sl<BoardRepository>()));
  sl.registerLazySingleton<PieceMove>(() => PieceMove(sl<BoardRepository>()));
  // Repository
  sl.registerLazySingleton<BoardRepository>(
    () => BoardRepositoryImpl(),
  );
  // Data sources
  // Core
  // External
}
