import 'package:cleanchess/chess/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteUserDataSource {
  /// Api to get a list of users by a search term
  /// [term] is the search term
  /// [friend] is a boolean to search for friends only
  Future<Either<Failure, List<User>>> getUsersByTerm(
    String term,
    bool friend,
  );

  /// Api to get a list of usernames by a search term
  /// [term] is the search term
  /// [friend] is a boolean to search for friends only
  Future<Either<Failure, List<String>>> getUsernamesByTerm(
    String term,
    bool friend,
  );

  /// Api to get a list of the Realtime User Stats
  Future<Either<Failure, List<RealTimeUserStatus>>> getRealtimeStatus(
    List<String> ids,
    bool withGameIds,
  );
}
