import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart' as http;
import 'dart:math' as math;

/// All the characters that are allowed in a verifier
const String _charset =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

/// Generates a random verifier
String get getRandomVerifier => List.generate(
      128,
      (i) => _charset[math.Random.secure().nextInt(_charset.length)],
    ).join();

/// Creates an authorization code grant with the given parameters
/// and a random verifier as code verifier.
oauth2.AuthorizationCodeGrant getAuthorizationCodeGrant({
  required String clientId,
  required String oauthUri,
  required String tokenUri,
}) =>
    oauth2.AuthorizationCodeGrant(
      clientId,
      Uri.parse('https://lichess.org/oauth'),
      Uri.parse('https://lichess.org/api/token'),
      httpClient: http.Client(),
      codeVerifier: getRandomVerifier,
    );
