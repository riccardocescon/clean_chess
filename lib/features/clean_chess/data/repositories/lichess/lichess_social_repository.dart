import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_social_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_social_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/social_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessSocialRepository implements SocialRepository {
  final LichessSocialDataSource socialDataSource;

  const LichessSocialRepository({required this.socialDataSource});

  @override
  Future<Either<Failure, List<User>>> getFollowingUsers() =>
      socialDataSource.getFollowingUsers();
}
