import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/core/utilities/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class BoardRepository {
  Future<Either<Failure, Keepalive>> createRealTimeSeek({
    required double time,
    required int increment,
    DaysPerTurn? days,
    bool rated = false,
    LichessVariantKey variant = LichessVariantKey.standard,
    LichessChallengeColor color = LichessChallengeColor.random,
    int? maxRating,
    int? minRating,
  });

  Future<Either<Failure, Keepalive>> createCorrespondenceSeek({
    required DaysPerTurn days,
    bool rated = false,
    LichessVariantKey variant = LichessVariantKey.standard,
    LichessChallengeColor color = LichessChallengeColor.random,
    double? time,
    int? increment,
    int? maxRating,
    int? minRating,
  });

  Future<Either<Failure, Empty>> abortGame(String gameId);

  Future<Either<Failure, Empty>> claimVictory(String gameId);

  Future<Either<Failure, Stream<LichessGameChatMessage>>> fetchGameChat(
    String gameId,
  );

  Future<Either<Failure, Empty>> writeOnGameChat({
    required String gameId,
    required LichessChatLineRoom room,
    required String text,
  });

  Future<Either<Failure, Empty>> resignGame(String gameId);

  Future<Either<Failure, Empty>> makeMove({
    required String gameId,
    required String move,
    bool? offeringDraw,
  });

  Future<Either<Failure, Stream<LichessBoardGameEvent>>> streamGameState(
    String gameId,
  );

  Future<Either<Failure, Stream<LichessBoardGameIncomingEvent>>>
      streamIncomingEvents();
}
