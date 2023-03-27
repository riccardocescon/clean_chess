import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_oauth_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/oauth_repository.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth.dart';
import 'package:dartz/dartz.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class LichessOAuthRepository implements OAuthRepository {
  final RemoteOAuthDataSource oAuthDataSource;

  const LichessOAuthRepository({required this.oAuthDataSource});

  @override
  Future<Either<Failure, String>> authenticate({
    required oauth2.AuthorizationCodeGrant grant,
    required String stateVerifier,
    required String redirectUri,
  }) =>
      oAuthDataSource.authenticate(
        grant: grant,
        stateVerifier: stateVerifier,
        redirectUri: redirectUri,
      );

  @override
  Future<Either<Failure, String>> gainAccessToken({
    required oauth2.AuthorizationCodeGrant grant,
    required OAuthParams params,
  }) =>
      oAuthDataSource.gainAccessToken(
        grant: grant,
        params: params,
      );

  @override
  Future<Either<Failure, Empty>> revokeToken(String accessToken) =>
      oAuthDataSource.revokeToken(accessToken);
}
