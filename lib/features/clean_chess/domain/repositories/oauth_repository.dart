import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth.dart';
import 'package:dartz/dartz.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

abstract class OAuthRepository {
  Future<Either<Failure, String>> authenticate({
    required oauth2.AuthorizationCodeGrant grant,
    required String stateVerifier,
    required String redirectUri,
  });

  Future<Either<Failure, String>> gainAccessToken({
    required oauth2.AuthorizationCodeGrant grant,
    required OAuthParams params,
  });
}
