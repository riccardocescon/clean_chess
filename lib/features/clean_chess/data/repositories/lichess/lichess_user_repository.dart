import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_user_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessUserRepository implements UserRepository {
  final LichessUserDataSource dataSource;

  LichessUserRepository({required this.dataSource});

  @override
  Future<Either<Failure, List<User>>> getUsersByTerm(
    String term,
    bool friend,
  ) =>
      dataSource.getUsersByTerm(term, friend);
}
