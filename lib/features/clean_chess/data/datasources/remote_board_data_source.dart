import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/core/utilities/globals.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteBoardDataSource {
  /// APi to create a real time seek
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

  /// API to create a correspondence seek
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

  /// API to Abort a Game
  Future<Either<Failure, Empty>> abortGame(String gameId);

  /// API to claim victory
  Future<Either<Failure, Empty>> claimVictory(String gameId);

  /// API to fetch game chat
  Future<Either<Failure, Stream<LichessGameChatMessage>>> fetchGameChat(
    String gameId,
  );

  /// API to write on the game chat
  Future<Either<Failure, Empty>> writeOnGameChat({
    required String gameId,
    required LichessChatLineRoom room,
    required String text,
  });

  /// API to resign a game
  Future<Either<Failure, Empty>> resignGame(String gameId);

  /// API to make a move
  Future<Either<Failure, Empty>> makeMove({
    required String gameId,
    required String move,
    bool? offeringDraw,
  });

  /// API to stream board game state
  Future<Either<Failure, Stream<LichessBoardGameEvent>>> streamBoardGameState(
    String gameId,
  );

  /// API to stream incoming events
  Future<Either<Failure, Stream<LichessBoardGameIncomingEvent>>>
      streamIncomingEvents();
}
