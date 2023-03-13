import 'package:cleanchess/chess/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsersByTerm(
    String term,
    bool friend,
  );

  Future<Either<Failure, List<String>>> getUsernamesByTerm(
    String term,
    bool friend,
  );

  Future<Either<Failure, List<RealTimeUserStatus>>> getRealtimeStatus(
    List<String> ids,
    bool withGameIds,
  );

  Future<Either<Failure, Map<String, List<User>>>> getTop10Players();

  Future<Either<Failure, List<User>>> getChessVariantLeaderboard(
    PerfType perfType,
    int nb,
  );

  Future<Either<Failure, User>> getPublicData({
    required String username,
    bool trophies = false,
  });
}
