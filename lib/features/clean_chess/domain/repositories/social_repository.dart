import 'package:cleanchess/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class SocialRepository {
  Future<Either<Failure, List<User>>> getFollowingUsers();

  Future<Either<Failure, bool>> followUser(String username);

  Future<Either<Failure, bool>> unfollowUser(String username);
}
