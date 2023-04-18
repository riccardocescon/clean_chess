import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_oauth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:cleanchess/core/utilities/extentions.dart';

typedef OAuthParams = Map<String, String>;

/// This class is responsible for Analyzing and Validating the response
/// received from the [NetRepositoryImpl] and returning either a [Failure]
/// or a Model requested by the [Bloc]
class LichessOAuth implements UseCase<OAuthParams, LichessOAuthParams> {
  final LichessOAuthRepository oAuthRepository;

  const LichessOAuth(this.oAuthRepository);

  @override
  Future<Either<Failure, OAuthParams>> call(LichessOAuthParams params) async {
    // Perform the authentication request
    final response = await oAuthRepository.authenticate(
      grant: params.grant,
      stateVerifier: params.stateVerifier,
      redirectUri: params.redirectUri,
    );

    if (response.isLeft()) return Left(response.left);

    // Extract the response data
    final responseData = response.right;
    final uri = Uri.parse(responseData);
    final OAuthParams parameters = uri.queryParameters;

    // Validate the response data
    switch (parameters['error']) {
      // Success case
      case null:
        final code = parameters['code'];
        final state = parameters['state'];

        if (state != params.stateVerifier) {
          return const Left(LichessOAuthFailure('State Mismatch'));
        }

        if (code == null) {
          return const Left(LichessOAuthFailure('Code is null'));
        }

        return Right(parameters);

      // Failure cases
      case 'access_denied':
        return const Left(LichessOAuthFailure('Access Denied'));

      // Add here more cases for other errors if needed

      default:
        return Left(
          LichessOAuthFailure('Unknown Error ${parameters["error"]}'),
        );
    }
  }
}

class LichessOAuthParams {
  final oauth2.AuthorizationCodeGrant grant;
  final String stateVerifier;
  final String redirectUri;

  LichessOAuthParams({
    required this.grant,
    required this.stateVerifier,
    required this.redirectUri,
  });
}
