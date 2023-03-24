import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_user_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessUserRepository implements UserRepository {
  final LichessUserDataSource dataSource;

  LichessUserRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<User>>> searchByTerm(
    String term,
    bool friend,
  ) =>
      dataSource.searchUsersByTerm(term, friend);

  @override
  Future<Either<Failure, List<String>>> searchNamesByTerm(
    String term,
    bool friend,
  ) =>
      dataSource.searchNamesByTerm(term, friend);

  @override
  Future<Either<Failure, List<RealTimeUserStatus>>> getRealtimeStatus(
    List<String> ids,
    bool withGameIds,
  ) =>
      dataSource.getRealtimeStatus(ids, withGameIds);

  @override
  Future<Either<Failure, Map<String, List<User>>>> getTop10Players() =>
      dataSource.getTop10Players();

  @override
  Future<Either<Failure, List<User>>> getChessVariantLeaderboard(
    PerfType perfType,
    int nb,
  ) =>
      dataSource.getChessVariantLeaderboard(perfType, nb);

  @override
  Future<Either<Failure, User>> getPublicData({
    required String username,
    bool trophies = false,
  }) =>
      dataSource.getPublicData(username: username, trophies: trophies);

  @override
  Future<Either<Failure, List<RatingHistory>>> getRatingHistory(
    String username,
  ) =>
      dataSource.getRatingHistory(username);

  @override
  Future<Either<Failure, List<User>>> getManyByIds(
    List<String> ids,
  ) =>
      dataSource.getManyByIds(ids);

  @override
  Future<Either<Failure, List<User>>> getLiveStreamers() =>
      dataSource.getLiveStreamers();
}
