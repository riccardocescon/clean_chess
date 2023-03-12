import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess_oauth.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

abstract class RemoteDataSource {
  /// API request to authenticate with OAuth2
  Future<Either<Failure, String>> authenticate({
    required oauth2.AuthorizationCodeGrant grant,
    required String stateVerifier,
    required String redirectUri,
  });

  /// API request to gain access token from OAuth2
  /// using the authorization code returned from the [authenticate] method
  Future<Either<Failure, String>> gainAccessToken({
    required oauth2.AuthorizationCodeGrant grant,
    required OAuthParams params,
  });

  /// API request to get user profile
  Future<Either<Failure, User>> getMyUserProfile();

  /// API request to get user email
  /// This is a separate API call because the email is not returned
  /// in the user profile API call
  Future<Either<Failure, String>> getMyUserEmail();

  /// API request to get user kid mode status
  /// This is a separate API call because the kid mode status is not returned
  /// in the user profile API call
  Future<Either<Failure, bool>> getMyKidModeStatus();

  /// API request to set user kid mode status
  Future<Either<Failure, Empty>> setMyKidModeStatus({required bool status});
}
