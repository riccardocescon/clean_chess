import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/puzzle/puzzle.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

part 'puzzle_cubit.freezed.dart';

@freezed
abstract class PuzzleState with _$PuzzleState, EquatableMixin {
  const factory PuzzleState.initial() = _InitialPuzzleState;

  const factory PuzzleState.loading() = _LoadingPuzzleState;

  const factory PuzzleState.dailyPuzzle(LichessPuzzle puzzle) =
      _DailyPuzzleState;

  const factory PuzzleState.puzzleById(LichessPuzzle puzzle) = _PuzzleByIdState;

  const factory PuzzleState.puzzleActivity(LichessPuzzleActivity activity) =
      _PuzzleActivityState;

  const factory PuzzleState.puzzleDashboard(LichessPuzzleDashboard dashboard) =
      _PuzzleDashboardState;

  const factory PuzzleState.failure(Failure error) = _ErrorPuzzleState;

  const PuzzleState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      puzzleActivity: (activity) => [activity],
      failure: (error) => [error],
      orElse: () => [],
    );
  }
}

class PuzzleCubit extends Cubit<PuzzleState> {
  PuzzleCubit({
    required GetDailyPuzzle getDailyPuzzle,
    required GetPuzzleById getPuzzleById,
    required GetPuzzleActivity getPuzzleActivity,
    required GetPuzzleDashboard getPuzzleDashboard,
  }) : super(const _InitialPuzzleState()) {
    _getDailyPuzzle = getDailyPuzzle;
    _getPuzzleById = getPuzzleById;
    _getPuzzleActivity = getPuzzleActivity;
    _getPuzzleDashboard = getPuzzleDashboard;
  }

  late final GetDailyPuzzle _getDailyPuzzle;
  late final GetPuzzleById _getPuzzleById;
  late final GetPuzzleActivity _getPuzzleActivity;
  late final GetPuzzleDashboard _getPuzzleDashboard;

  Future<void> getDailyPuzzle() async {
    emit(const _LoadingPuzzleState());
    final result = await _getDailyPuzzle();
    result.fold(
      (failure) => emit(_ErrorPuzzleState(failure)),
      (puzzle) => emit(_DailyPuzzleState(puzzle)),
    );
  }

  Future<void> getPuzzleById(String id) async {
    emit(const _LoadingPuzzleState());
    final result = await _getPuzzleById(id);
    result.fold(
      (failure) => emit(_ErrorPuzzleState(failure)),
      (puzzle) => emit(_PuzzleByIdState(puzzle)),
    );
  }

  Future<void> getPuzzleActivity({int? max}) async {
    emit(const _LoadingPuzzleState());
    final result = await _getPuzzleActivity(max);
    if (result.isLeft()) {
      emit(_ErrorPuzzleState(result.left));
      return;
    }

    await for (final LichessPuzzleActivity current in result.right) {
      emit(_PuzzleActivityState(current));
    }
  }

  Future<void> getPuzzleDashboard({int days = 30}) async {
    emit(const _LoadingPuzzleState());
    final result = await _getPuzzleDashboard(days);
    result.fold(
      (failure) => emit(_ErrorPuzzleState(failure)),
      (dashboard) => emit(_PuzzleDashboardState(dashboard)),
    );
  }
}
