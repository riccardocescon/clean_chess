import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/extensions.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/lichess_repositoy.dart';
import 'package:dartz/dartz.dart';

/// This class is responsible for Analyzing and Validating the response
/// received from the [NetRepositoryImpl] and returning either a [Failure]
/// or a Model requested by the [Bloc]
class LichessOAuth implements UseCase<Empty, LichessOAuthParams> {
  final LichessRepository netRepository;

  const LichessOAuth(this.netRepository);

  @override
  Future<Either<Failure, Empty>> call(LichessOAuthParams params) async {
    final response = await netRepository.authenticate(
      codeVerifier: params.codeVerifier,
      stateVerifier: params.stateVerifier,
      clientId: params.clientId,
      redirectUri: params.redirectUri,
    );

    if (response.isLeft()) return Left(response.left);

    final responseData = response.right;

    // Save on local storage
    final uri = Uri.parse(responseData);

    final responseQuery = uri.queryParameters;

    switch (responseQuery['error']) {
      case 'access_denied':
        return Left(LichessOAuthFailure('Access Denied'));
      case null:
        final _ = responseQuery['code'];
        final state = responseQuery['state'];

        if (state != params.stateVerifier) {
          return Left(LichessOAuthFailure('State Mismatch'));
        }
        break;
    }

    return const Right(Empty());
  }
}

class LichessOAuthParams {
  final String codeVerifier;
  final String stateVerifier;
  final String clientId;
  final String redirectUri;

  LichessOAuthParams({
    required this.codeVerifier,
    required this.stateVerifier,
    required this.clientId,
    required this.redirectUri,
  });
}
