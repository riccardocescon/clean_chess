import 'dart:async';

import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/game/export_game.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/game/export_games_of_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

part 'game_cubit.freezed.dart';

@freezed
abstract class GameState with _$GameState, EquatableMixin {
  const factory GameState.initial() = _InitialGameState;

  const factory GameState.loading() = _LoadingGameState;

  const factory GameState.gameExported(LichessGame game) =
      _GameExportedGameState;

  const factory GameState.failure(Failure error) = _ErrorGameState;

  const GameState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      gameExported: (game) => [game.id],
      failure: (error) => [error],
      orElse: () => [],
    );
  }
}

class GameCubit extends Cubit<GameState> {
  GameCubit({
    required ExportGame exportGame,
    required ExportGamesOfUser exportGamesOfUser,
  }) : super(const _InitialGameState()) {
    _exportGame = exportGame;
    _exportGamesOfUser = exportGamesOfUser;
  }

  late final ExportGame _exportGame;
  late final ExportGamesOfUser _exportGamesOfUser;
  StreamSubscription<LichessGame>? _exporGamesSubscription;

  Future<void> exportGame({
    required String gameId,
    bool moves = true,
    bool pgnInJson = false,
    bool tags = true,
    bool clocks = false,
    bool evals = true,
    bool accuracy = false,
    bool opening = false,
    bool literate = false,
    String? players,
  }) async {
    emit(const _LoadingGameState());

    final result = await _exportGame(
      ExportGameParams(
        gameId: gameId,
        moves: moves,
        pgnInJson: pgnInJson,
        tags: tags,
        clocks: clocks,
        evals: evals,
        accuracy: accuracy,
        opening: opening,
        literate: literate,
        players: players,
      ),
    );

    result.fold(
      (failure) => emit(_ErrorGameState(failure)),
      (game) => emit(_GameExportedGameState(game)),
    );
  }

  Future<void> exportGamesOfUser({
    required String username,
    DateTime? since,
    DateTime? until,
    int? max,
    String? vs,
    bool? rated,
    List<PerfType>? perfTypes,
    LichessColor? color,
    bool? analysed,
    bool moves = true,
    bool pgnInJson = false,
    bool tags = true,
    bool clocks = false,
    bool evals = true,
    bool accuracy = false,
    bool opening = false,
    bool ongoing = false,
    bool finished = true,
    bool literate = false,
    bool lastFen = false,
    String? players,
    LichessGameSort? sort,
  }) async {
    emit(const _LoadingGameState());

    final result = await _exportGamesOfUser(
      ExportGamesOfUserParams(
        username: username,
        since: since,
        until: until,
        max: max,
        vs: vs,
        rated: rated,
        perfTypes: perfTypes,
        color: color,
        analysed: analysed,
        moves: moves,
        pgnInJson: pgnInJson,
        tags: tags,
        clocks: clocks,
        evals: evals,
        accuracy: accuracy,
        opening: opening,
        ongoing: ongoing,
        finished: finished,
        literate: literate,
        lastFen: lastFen,
        players: players,
        sort: sort,
      ),
    );

    if (result.isLeft()) {
      emit(_ErrorGameState(result.left));
      return Future.value();
    }

    _exporGamesSubscription?.cancel();
    _exporGamesSubscription = result.right.listen(
      (event) {
        emit(_GameExportedGameState(event));
        logDebug('Exported game: ${event.id}', color: LogColor.lightBlue);
      },
      onDone: () => logDebug(
        'Finished exporting games',
        color: LogColor.lightBlue,
      ),
    );
  }

  void stopExportingGames() async {
    _exporGamesSubscription?.cancel();
    logDebug('Stopped exporting games', color: LogColor.lightBlue);
  }
}
