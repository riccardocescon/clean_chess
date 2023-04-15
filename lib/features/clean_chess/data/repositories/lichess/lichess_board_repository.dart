import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/core/utilities/globals.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_board_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/board_repository.dart';
import 'package:lichess_client/src/models/board.dart';
import 'package:dartz/dartz.dart';

class LichessBoardRepository extends BoardRepository {
  final LichessBoardDataSource _boardDataSource;

  LichessBoardRepository(this._boardDataSource);

  @override
  Future<Either<Failure, Keepalive>> createRealTimeSeek({
    required double time,
    required int increment,
    DaysPerTurn? days,
    bool rated = false,
    LichessVariantKey variant = LichessVariantKey.standard,
    LichessChallengeColor color = LichessChallengeColor.random,
    int? maxRating,
    int? minRating,
  }) =>
      _boardDataSource.createRealTimeSeek(
        time: time,
        increment: increment,
        days: days,
        rated: rated,
        variant: variant,
        color: color,
        maxRating: maxRating,
        minRating: minRating,
      );

  @override
  Future<Either<Failure, Keepalive>> createCorrespondenceSeek({
    required DaysPerTurn days,
    bool rated = false,
    LichessVariantKey variant = LichessVariantKey.standard,
    LichessChallengeColor color = LichessChallengeColor.random,
    double? time,
    int? increment,
    int? maxRating,
    int? minRating,
  }) =>
      _boardDataSource.createCorrespondenceSeek(
        days: days,
        rated: rated,
        variant: variant,
        color: color,
        time: time,
        increment: increment,
        maxRating: maxRating,
        minRating: minRating,
      );

  @override
  Future<Either<Failure, Empty>> abortGame(String gameId) =>
      _boardDataSource.abortGame(gameId);

  @override
  Future<Either<Failure, Empty>> claimVictory(String gameId) =>
      _boardDataSource.claimVictory(gameId);

  @override
  Future<Either<Failure, Stream<LichessGameChatMessage>>> fetchGameChat(
    String gameId,
  ) =>
      _boardDataSource.fetchGameChat(gameId);

  @override
  Future<Either<Failure, Empty>> writeOnGameChat({
    required String gameId,
    required LichessChatLineRoom room,
    required String text,
  }) =>
      _boardDataSource.writeOnGameChat(
        gameId: gameId,
        room: room,
        text: text,
      );

  @override
  Future<Either<Failure, Empty>> resignGame(String gameId) =>
      _boardDataSource.resignGame(gameId);

  @override
  Future<Either<Failure, Empty>> makeMove({
    required String gameId,
    required String move,
    bool? offeringDraw,
  }) =>
      _boardDataSource.makeMove(
        gameId: gameId,
        move: move,
        offeringDraw: offeringDraw,
      );

  @override
  Future<Either<Failure, Stream<LichessBoardGameEvent>>> streamGameState(
    String gameId,
  ) =>
      _boardDataSource.streamBoardGameState(gameId);

  @override
  Future<Either<Failure, Stream<LichessBoardGameIncomingEvent>>>
      streamIncomingEvents() => _boardDataSource.streamIncomingEvents();
}
