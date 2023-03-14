import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class SocialRepository {
  Future<Either<Failure, List<User>>> getFollowingUsers();

  Future<Either<Failure, bool>> followUser(String username);
}
