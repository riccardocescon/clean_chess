import 'package:cleanchess/features/clean_chess/data/datasources/remote_data_source.dart';
import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:dartz/dartz.dart';

/// This class is responsible for making API calls to the interested DataSource
/// and returning the response to the [LichessRepositoryImpl]
///
/// This class is not resposible for any business logic
class LichessRepositoryImpl implements LichessRepository {
  final RemoteDataSource remoteDataSource;

  const LichessRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> authenticate({
    required String codeVerifier,
    required String stateVerifier,
    required String clientId,
    required String redirectUri,
  }) =>
      remoteDataSource.authenticate(
        codeVerifier: codeVerifier,
        stateVerifier: stateVerifier,
        clientId: clientId,
        redirectUri: redirectUri,
      );
}
