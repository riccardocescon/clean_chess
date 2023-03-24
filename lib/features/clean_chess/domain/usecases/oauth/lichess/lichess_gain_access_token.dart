import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_oauth_repository.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth.dart';
import 'package:dartz/dartz.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class LichessGainAccessToken
    extends UseCase<String, LichessGainAccessTokenParams> {
  final LichessOAuthRepository oAuthRepository;

  LichessGainAccessToken(this.oAuthRepository);

  @override
  Future<Either<Failure, String>> call(LichessGainAccessTokenParams params) =>
      oAuthRepository.gainAccessToken(
        grant: params.grant,
        params: params.parameters,
      );
}

class LichessGainAccessTokenParams {
  final oauth2.AuthorizationCodeGrant grant;
  final OAuthParams parameters;

  const LichessGainAccessTokenParams({
    required this.grant,
    required this.parameters,
  });
}
