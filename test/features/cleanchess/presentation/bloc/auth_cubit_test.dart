import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/auth_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

import '../../general_mocks.mocks.dart';
import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMLichessTokenProvider mockLichessTokenProvider;
  late MockMLichessOAuth mockLichessOAuth;
  late MockMLichessRevokeToken mockLichessRevokeToken;
  late MockMLichessGainAccessToken mockLichessGainAccessToken;

  late AuthCubit bloc;

  setUp(() {
    mockLichessTokenProvider = MockMLichessTokenProvider();
    mockLichessOAuth = MockMLichessOAuth();
    mockLichessRevokeToken = MockMLichessRevokeToken();
    mockLichessGainAccessToken = MockMLichessGainAccessToken();

    bloc = AuthCubit(
      oauth: mockLichessOAuth,
      revokeToken: mockLichessRevokeToken,
      gainAccessToken: mockLichessGainAccessToken,
      tokenProvider: mockLichessTokenProvider,
    );
  });

  group('OAuth', () {
    group('LichessOAuthEvent', () {
      blocTest<AuthCubit, AuthState>(
        'Success',
        build: () {
          when(mockLichessOAuth.call(any)).thenAnswer(
            (_) async => const Right({
              'code': '_fake_code_',
              'state': '_fake_state_',
            }),
          );

          when(mockLichessGainAccessToken.call(any)).thenAnswer(
            (_) async => const Right('access_token'),
          );

          when(mockLichessTokenProvider.saveAccessToken(any)).thenAnswer(
            (_) async => const Right(null),
          );

          return bloc;
        },
        act: (bloc) => bloc.login(),
        expect: () => [
          const AuthState.loading(),
          const AuthState.logged(),
        ],
        verify: (bloc) {
          verify(mockLichessOAuth.call(any)).called(1);
          verify(mockLichessGainAccessToken.call(any)).called(1);
          verify(mockLichessTokenProvider.saveAccessToken(any)).called(1);
        },
      );

      blocTest<AuthCubit, AuthState>(
        'Failure on OAuth',
        build: () {
          when(mockLichessOAuth.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAtuh error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.login(),
        expect: () => [
          const AuthState.loading(),
          const AuthState.failure(LichessOAuthFailure('OAtuh error')),
        ],
        verify: (bloc) {
          verify(mockLichessOAuth.call(any)).called(1);
          verifyNever(mockLichessGainAccessToken.call(any));
          verifyNever(mockLichessTokenProvider.saveAccessToken(any));
        },
      );

      blocTest<AuthCubit, AuthState>(
        'Failure on GainAccessToken',
        build: () {
          when(mockLichessOAuth.call(any)).thenAnswer(
            (_) async => const Right({
              'code': '_fake_code_',
              'state': '_fake_state_',
            }),
          );

          when(mockLichessGainAccessToken.call(any)).thenAnswer(
            (_) async =>
                const Left(LichessOAuthFailure('GainAccessToken error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.login(),
        expect: () => [
          const AuthState.loading(),
          const AuthState.failure(LichessOAuthFailure('GainAccessToken error')),
        ],
        verify: (bloc) {
          verify(mockLichessOAuth.call(any)).called(1);
          verify(mockLichessGainAccessToken.call(any)).called(1);
          verifyNever(mockLichessTokenProvider.saveAccessToken(any));
        },
      );

      blocTest(
        'Success Revoke Token',
        build: () {
          when(mockLichessRevokeToken.call(any)).thenAnswer(
            (_) async => const Right(null),
          );

          return bloc;
        },
        act: (bloc) => bloc.revoke(),
        expect: () => [
          const AuthState.loading(),
          const AuthState.loggedOut(),
        ],
        verify: (bloc) {
          verify(mockLichessRevokeToken.call(any)).called(1);
        },
      );

      blocTest(
        'Failure Revoke Token',
        build: () {
          when(mockLichessRevokeToken.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('RevokeToken error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.revoke(),
        expect: () => [
          const AuthState.loading(),
          const AuthState.failure(LichessOAuthFailure('RevokeToken error')),
        ],
        verify: (bloc) {
          verify(mockLichessRevokeToken.call(any)).called(1);
        },
      );
    });
  });
}
