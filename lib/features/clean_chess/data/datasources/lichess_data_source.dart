import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_data_source.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/lichess_oauth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:oauth2/oauth2.dart' as oauth2;

/// This class is responsible for making API calls to Lichess
/// and returning the response to the [NetRepositoryImpl]
///
/// This class is not resposible for any business logic
class LichessDataSource extends RemoteDataSource {
  /// API request to authenticate with Lichess OAuth2
  @override
  Future<Either<Failure, String>> authenticate({
    required String stateVerifier,
    required String redirectUri,
    required oauth2.AuthorizationCodeGrant grant,
  }) async {
    // Create the authorization URL
    final Uri redirect = Uri.parse(redirectUri);
    final authorizationUrl = grant.getAuthorizationUrl(
      redirect,
      scopes: ['challenge:read', 'challenge:write'],
      state: stateVerifier,
    );

    try {
      // Open the authorization URL in the browser
      final result = await FlutterWebAuth.authenticate(
        url: authorizationUrl.toString(),
        callbackUrlScheme: redirect.scheme,
      );

      // Handle the result
      return Right(result);
    } on PlatformException catch (e) {
      if (e.code == 'CANCELLED') {
        return Left(LichessOAuthCancelled());
      }
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  /// API request to gain access token from Lichess OAuth2
  /// using the authorization code returned from the [authenticate] method
  @override
  Future<Either<Failure, String>> gainAccessToken({
    required oauth2.AuthorizationCodeGrant grant,
    required OAuthParams params,
  }) async {
    try {
      final response = await grant.handleAuthorizationResponse(params);
      return Right(response.credentials.accessToken);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
