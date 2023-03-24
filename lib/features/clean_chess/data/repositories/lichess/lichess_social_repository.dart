import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_social_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/social_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessSocialRepository implements SocialRepository {
  final LichessSocialDataSource socialDataSource;

  const LichessSocialRepository({required this.socialDataSource});

  @override
  Future<Either<Failure, List<User>>> getFollowingUsers() =>
      socialDataSource.getFollowingUsers();

  @override
  Future<Either<Failure, bool>> followUser(String username) =>
      socialDataSource.followUser(username);

  @override
  Future<Either<Failure, bool>> unfollowUser(String username) =>
      socialDataSource.unfollowUser(username);
}
