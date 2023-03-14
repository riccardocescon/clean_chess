import 'package:cleanchess/chess/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

abstract class RemoteSocialDataSource {
  /// Api call to get the Following users
  Future<Either<Failure, List<User>>> getFollowingUsers();
}
