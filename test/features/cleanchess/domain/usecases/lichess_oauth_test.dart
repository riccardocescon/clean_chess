import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:oauth2/oauth2.dart';
import 'package:cleanchess/core/utilities/extentions.dart';

import 'repo_mocks.mocks.dart';
import 'usecases_test_utilities.dart' as usecases_test_utils;

void main() {
  late MockMLichessOAuthRepository mockLichessRepository;
  late LichessOAuth oauth;

  setUp(() {
    mockLichessRepository = MockMLichessOAuthRepository();
    oauth = LichessOAuth(mockLichessRepository);
  });

  group('LichessOAuth', () {
    // Success case
    test('should return a Map<String, String> when the response is valid',
        () async {
      const codeVerifier = '_fake_code_';
      const stateVerifier = '_fake_state_';

      usecases_test_utils.setSuccessAuthResponse(
        mockLichessRepository: mockLichessRepository,
        stateVerifier: stateVerifier,
      );

      final result = await oauth.call(
        LichessOAuthParams(
          grant: AuthorizationCodeGrant(
            'cleanchess',
            Uri.parse('https://lichess.org/oauth'),
            Uri.parse('https://lichess.org/api/token'),
          ),
          stateVerifier: stateVerifier,
          redirectUri: 'com.example.cleanchess://authorize',
        ),
      );

      expect(result.isRight(), true);

      const matcher = {
        'code': codeVerifier,
        'state': stateVerifier,
      };
      expect(result.right, matcher);
    });

    group('Failure Cases', () {
      test('User Cancelled', () async {
        const error =
            'access_denied&error_description=user+cancelled+authorization';
        const stateVerifier = '_fake_state_';

        when(mockLichessRepository.authenticate(
          grant: anyNamed('grant'),
          stateVerifier: anyNamed('stateVerifier'),
          redirectUri: anyNamed('redirectUri'),
        )).thenAnswer(
          (_) async => const Right(
            'com.example.cleanchess://authorize?error=$error&state=$stateVerifier',
          ),
        );

        final result = await oauth.call(
          LichessOAuthParams(
            grant: AuthorizationCodeGrant(
              'cleanchess',
              Uri.parse('https://lichess.org/oauth'),
              Uri.parse('https://lichess.org/api/token'),
            ),
            stateVerifier: stateVerifier,
            redirectUri: 'com.example.cleanchess://authorize',
          ),
        );

        expect(result.isLeft(), true);
        expect(result.left, isA<LichessOAuthFailure>());
      });

      test('State Mismatch', () async {
        const codeVerifier = '_fake_code_';
        const stateVerifier = '_fake_state_';
        const stateMismatch = '_fake_state_mismatch_';

        when(mockLichessRepository.authenticate(
          grant: anyNamed('grant'),
          stateVerifier: anyNamed('stateVerifier'),
          redirectUri: anyNamed('redirectUri'),
        )).thenAnswer(
          (_) async => const Right(
            'com.example.cleanchess://authorize?code=$codeVerifier&state=$stateMismatch',
          ),
        );

        final result = await oauth.call(
          LichessOAuthParams(
            grant: AuthorizationCodeGrant(
              'cleanchess',
              Uri.parse('https://lichess.org/oauth'),
              Uri.parse('https://lichess.org/api/token'),
            ),
            stateVerifier: stateVerifier,
            redirectUri: 'com.example.cleanchess://authorize',
          ),
        );

        expect(result.isLeft(), true);
        expect(result.left, isA<LichessOAuthFailure>());
      });
    });
  });
}
