import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart' as http;

/// This class is responsible for making API calls to Lichess
/// and returning the response to the [NetRepositoryImpl]
///
/// This class is not resposible for any business logic
class LichessDataSource extends RemoteDataSource {
  @override
  Future<Either<Failure, String>> authenticate({
    required String codeVerifier,
    required String stateVerifier,
    required String clientId,
    required String redirectUri,
  }) async {
    final grant = oauth2.AuthorizationCodeGrant(
      clientId,
      Uri.parse('https://lichess.org/oauth'),
      Uri.parse('https://lichess.org/api/token'),
      httpClient: http.Client(),
      codeVerifier: codeVerifier,
    );

    final Uri redirect = Uri.parse(redirectUri);

    final authorizationUrl = grant.getAuthorizationUrl(
      redirect,
      scopes: ['challenge:read', 'challenge:write'],
      state: stateVerifier,
    );

    try {
      // Present the dialog to the user
      final result = await FlutterWebAuth.authenticate(
        url: authorizationUrl.toString(),
        callbackUrlScheme: redirect.scheme,
      );
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
}
