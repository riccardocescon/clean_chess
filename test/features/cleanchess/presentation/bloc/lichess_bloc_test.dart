import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/mockito.dart';

import '../../general_mocks.mocks.dart';
import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMLichessOAuth mockLichessOAuth;
  late MockMLichessGainAccessToken mockLichessGainAccessToken;
  late MockMGetMyProfile mockGetMyProfile;
  late MockMLichessTokenProvider mockLichessTokenProvider;
  late MockMGetMyEmail mockGetMyEmail;
  late MockMGetMyKidModeStatus mockGetMyKidModeStatus;
  late MockMSetMyKidModeStatus mockSetMyKidModeStatus;
  late MockMGetMyPreferences mockGetMyPreferences;

  late LichessBloc bloc;

  setUp(() {
    mockLichessTokenProvider = MockMLichessTokenProvider();
    mockLichessOAuth = MockMLichessOAuth();
    mockLichessGainAccessToken = MockMLichessGainAccessToken();
    mockGetMyProfile = MockMGetMyProfile();
    mockGetMyEmail = MockMGetMyEmail();
    mockGetMyKidModeStatus = MockMGetMyKidModeStatus();
    mockSetMyKidModeStatus = MockMSetMyKidModeStatus();
    mockGetMyPreferences = MockMGetMyPreferences();

    bloc = LichessBloc(
      tokenProvider: mockLichessTokenProvider,
      oauth: mockLichessOAuth,
      gainAccessToken: mockLichessGainAccessToken,
      getMyProfile: mockGetMyProfile,
      getMyEmail: mockGetMyEmail,
      getMyKidModeStatus: mockGetMyKidModeStatus,
      setMyKidModeStatus: mockSetMyKidModeStatus,
      getMyPreferences: mockGetMyPreferences,
    );
  });

  group('LichessOAuthEvent', () {
    blocTest<LichessBloc, LichessState>(
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
      act: (bloc) => bloc.add(const LichessOAuthEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessOAuthSuccess>(),
      ],
      verify: (bloc) {
        verify(mockLichessOAuth.call(any)).called(1);
        verify(mockLichessGainAccessToken.call(any)).called(1);
        verify(mockLichessTokenProvider.saveAccessToken(any)).called(1);
      },
    );

    blocTest<LichessBloc, LichessState>(
      'Failure on OAuth',
      build: () {
        when(mockLichessOAuth.call(any)).thenAnswer(
          (_) async => Left(LichessOAuthFailure('OAtuh error')),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const LichessOAuthEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessError>(),
      ],
      verify: (bloc) {
        verify(mockLichessOAuth.call(any)).called(1);
        verifyNever(mockLichessGainAccessToken.call(any));
        verifyNever(mockLichessTokenProvider.saveAccessToken(any));
      },
    );

    blocTest<LichessBloc, LichessState>(
      'Failure on GainAccessToken',
      build: () {
        when(mockLichessOAuth.call(any)).thenAnswer(
          (_) async => const Right({
            'code': '_fake_code_',
            'state': '_fake_state_',
          }),
        );

        when(mockLichessGainAccessToken.call(any)).thenAnswer(
          (_) async => Left(LichessOAuthFailure('GainAccessToken error')),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const LichessOAuthEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessError>(),
      ],
      verify: (bloc) {
        verify(mockLichessOAuth.call(any)).called(1);
        verify(mockLichessGainAccessToken.call(any)).called(1);
        verifyNever(mockLichessTokenProvider.saveAccessToken(any));
      },
    );
  });

  group('GetMyProfile', () {
    blocTest<LichessBloc, LichessState>(
      'Success',
      build: () {
        when(mockGetMyProfile.call(any)).thenAnswer(
          (_) async => const Right(User()),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const GetMyProfileEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessUserFetched>(),
      ],
      verify: (bloc) {
        verify(mockGetMyProfile.call(any)).called(1);
      },
    );

    blocTest<LichessBloc, LichessState>(
      'Failure',
      build: () {
        when(mockGetMyProfile.call(any)).thenAnswer(
          (_) async => Left(LichessOAuthFailure('OAuth failure')),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const GetMyProfileEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessError>(),
      ],
      verify: (bloc) {
        verify(mockGetMyProfile.call(any)).called(1);
      },
    );
  });

  group('GetMyEmail', () {
    blocTest<LichessBloc, LichessState>(
      'Success',
      build: () {
        when(mockGetMyEmail.call(any)).thenAnswer(
          (_) async => const Right('email'),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const GetMyEmailEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessLoaded<String>>(),
      ],
      verify: (bloc) {
        verify(mockGetMyEmail.call(any)).called(1);
      },
    );

    blocTest<LichessBloc, LichessState>(
      'Failure',
      build: () {
        when(mockGetMyEmail.call(any)).thenAnswer(
          (_) async => Left(LichessOAuthFailure('OAuth failure')),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const GetMyEmailEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessError>(),
      ],
      verify: (bloc) {
        verify(mockGetMyEmail.call(any)).called(1);
      },
    );
  });

  group('GetMyKidModeStatus', () {
    blocTest<LichessBloc, LichessState>(
      'Success',
      build: () {
        when(mockGetMyKidModeStatus.call(any)).thenAnswer(
          (_) async => const Right(true),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const GetMyKidModeStatusEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessLoaded<bool>>(),
      ],
      verify: (bloc) {
        verify(mockGetMyKidModeStatus.call(any)).called(1);
      },
    );

    blocTest<LichessBloc, LichessState>(
      'Failure',
      build: () {
        when(mockGetMyKidModeStatus.call(any)).thenAnswer(
          (_) async => Left(LichessOAuthFailure('OAuth failure')),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const GetMyKidModeStatusEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessError>(),
      ],
      verify: (bloc) {
        verify(mockGetMyKidModeStatus.call(any)).called(1);
      },
    );
  });

  group('SetMyKidModeStatusEvent', () {
    blocTest<LichessBloc, LichessState>(
      'Success',
      build: () {
        when(mockSetMyKidModeStatus.call(any)).thenAnswer(
          (_) async => const Right(Empty()),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const SetMyKidModeStatusEvent(true)),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessLoaded<Empty>>(),
      ],
      verify: (bloc) {
        verify(mockSetMyKidModeStatus.call(any)).called(1);
      },
    );

    blocTest<LichessBloc, LichessState>(
      'Failure',
      build: () {
        when(mockSetMyKidModeStatus.call(any)).thenAnswer(
          (_) async => Left(LichessOAuthFailure('OAuth failure')),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const SetMyKidModeStatusEvent(true)),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessError>(),
      ],
      verify: (bloc) {
        verify(mockSetMyKidModeStatus.call(any)).called(1);
      },
    );
  });

  group('GetMyPreferences', () {
    blocTest<LichessBloc, LichessState>(
      'Success',
      build: () {
        when(mockGetMyPreferences.call(any)).thenAnswer(
          (_) async => const Right(UserPreferences()),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const GetMyPreferencesEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessLoaded<UserPreferences>>(),
      ],
      verify: (bloc) {
        verify(mockGetMyPreferences.call(any)).called(1);
      },
    );

    blocTest<LichessBloc, LichessState>(
      'Failure',
      build: () {
        when(mockGetMyPreferences.call(any)).thenAnswer(
          (_) async => Left(LichessOAuthFailure('OAuth failure')),
        );

        return bloc;
      },
      act: (bloc) => bloc.add(const GetMyPreferencesEvent()),
      expect: () => [
        isA<LichessLoading>(),
        isA<LichessError>(),
      ],
      verify: (bloc) {
        verify(mockGetMyPreferences.call(any)).called(1);
      },
    );
  });
}
