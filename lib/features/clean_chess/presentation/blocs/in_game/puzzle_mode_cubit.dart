import 'dart:math';

import 'package:cleanchess/features/clean_chess/data/models/puzzle_model.dart';
import 'package:csv/csv.dart';
import 'package:dartchess/dartchess.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'puzzle_mode_cubit.freezed.dart';

@freezed
class PuzzleModeState with _$PuzzleModeState, EquatableMixin {
  const factory PuzzleModeState.initial() = _Initial;
  const factory PuzzleModeState.loading() = _Loading;
  const factory PuzzleModeState.turnOf(Side side) = _TurnOf;
  const factory PuzzleModeState.puzzleLoaded(PuzzleModel puzzle) = _Puzzle;
  const factory PuzzleModeState.pieceMoved(Move move) = _PieceMoved;

  const PuzzleModeState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      turnOf: (side) => [side],
      puzzleLoaded: (puzzle) => [puzzle],
      pieceMoved: (move) => [move],
      orElse: () => [],
    );
  }
}

class PuzzleModeCubit extends Cubit<PuzzleModeState> {
  PuzzleModeCubit() : super(const _Initial());

  void turnOf(Side side) {
    emit(_TurnOf(side));
  }

  Future<void> getRandomPuzzle() async {
    emit(const _Loading());
    const path = 'assets/puzzles/lichess_db_puzzle.csv';
    final value = await rootBundle.loadString(path);
    final res = const CsvToListConverter().convert(value);
    final puzzle = PuzzleModel.fromDB(res[Random().nextInt(res.length)]);
    emit(_Puzzle(puzzle));
  }

  void pieceMoved(Move move) {
    emit(_PieceMoved(move));
  }
}
