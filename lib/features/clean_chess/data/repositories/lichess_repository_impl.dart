import 'package:cleanchess/features/clean_chess/data/datasources/remote_data_source.dart';
import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/oauth.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

/// This class is responsible for making API calls to the interested DataSource
/// and returning the response to the [LichessRepositoryImpl]
///
/// This class is not resposible for any business logic
class LichessRepositoryImpl implements LichessRepository {
  final RemoteDataSource remoteDataSource;

  const LichessRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, String>> authenticate({
    required oauth2.AuthorizationCodeGrant grant,
    required String stateVerifier,
    required String redirectUri,
  }) =>
      remoteDataSource.authenticate(
        grant: grant,
        stateVerifier: stateVerifier,
        redirectUri: redirectUri,
      );

  @override
  Future<Either<Failure, String>> gainAccessToken({
    required oauth2.AuthorizationCodeGrant grant,
    required OAuthParams params,
  }) =>
      remoteDataSource.gainAccessToken(
        grant: grant,
        params: params,
      );

  @override
  Future<Either<Failure, User>> getUserProfile() =>
      remoteDataSource.getMyUserProfile();

  @override
  Future<Either<Failure, String>> getMyEmail() =>
      remoteDataSource.getMyUserEmail();

  @override
  Future<Either<Failure, bool>> getMyKidModeStatus() =>
      remoteDataSource.getMyKidModeStatus();
}
