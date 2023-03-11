import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/lichess_oauth.dart';
import 'package:dartz/dartz.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

class LichessGainAccessToken
    extends UseCase<String, LichessGainAccessTokenParams> {
  final LichessRepository lichessRepository;

  LichessGainAccessToken({required this.lichessRepository});

  @override
  Future<Either<Failure, String>> call(LichessGainAccessTokenParams params) =>
      lichessRepository.gainAccessToken(
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
