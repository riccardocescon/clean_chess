import 'package:cleanchess/features/clean_chess/data/datasources/remote_data_source.dart';
import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/net_repository.dart';
import 'package:dartz/dartz.dart';

/// This class is responsible for making API calls to the interested DataSource
/// and returning the response to the [NetRepositoryImpl]
///
/// This class is not resposible for any business logic
class NetRepositoryImpl implements NetRepository {
  final RemoteDataSource remoteDataSource;

  const NetRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
    String username,
    String password,
  ) {
    return remoteDataSource.login(username, password);
  }
}
