import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/account_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/mockito.dart';

import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMGetMyProfile mockGetMyProfile;
  late MockMGetMyEmail mockGetMyEmail;
  late MockMGetMyKidModeStatus mockGetMyKidModeStatus;
  late MockMSetMyKidModeStatus mockSetMyKidModeStatus;
  late MockMGetMyPreferences mockGetMyPreferences;

  late AccountCubit bloc;

  setUp(() {
    mockGetMyProfile = MockMGetMyProfile();
    mockGetMyEmail = MockMGetMyEmail();
    mockGetMyKidModeStatus = MockMGetMyKidModeStatus();
    mockSetMyKidModeStatus = MockMSetMyKidModeStatus();
    mockGetMyPreferences = MockMGetMyPreferences();

    bloc = AccountCubit(
      getMyProfile: mockGetMyProfile,
      getMyEmail: mockGetMyEmail,
      getMyPreferences: mockGetMyPreferences,
      getKidModeStatus: mockGetMyKidModeStatus,
      setKidModeStatus: mockSetMyKidModeStatus,
    );
  });

  group('Account', () {
    group('GetMyProfile', () {
      blocTest<AccountCubit, AccountState>(
        'Success',
        build: () {
          when(mockGetMyProfile.call()).thenAnswer(
            (_) async => const Right(User()),
          );

          return bloc;
        },
        act: (bloc) => bloc.getMyProfile(),
        expect: () => [
          const AccountState.loading(),
          const AccountState.profile(User()),
        ],
        verify: (bloc) {
          verify(mockGetMyProfile.call()).called(1);
        },
      );

      blocTest<AccountCubit, AccountState>(
        'Failure',
        build: () {
          when(mockGetMyProfile.call()).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getMyProfile(),
        expect: () => [
          const AccountState.loading(),
          const AccountState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetMyProfile.call()).called(1);
        },
      );
    });
    group('GetMyEmail', () {
      blocTest<AccountCubit, AccountState>(
        'Success',
        build: () {
          when(mockGetMyEmail.call()).thenAnswer(
            (_) async => const Right('email'),
          );

          return bloc;
        },
        act: (bloc) => bloc.getMyEmail(),
        expect: () => [
          const AccountState.loading(),
          const AccountState.myEmail('email'),
        ],
        verify: (bloc) {
          verify(mockGetMyEmail.call()).called(1);
        },
      );

      blocTest<AccountCubit, AccountState>(
        'Failure',
        build: () {
          when(mockGetMyEmail.call()).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getMyEmail(),
        expect: () => [
          const AccountState.loading(),
          const AccountState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetMyEmail.call()).called(1);
        },
      );
    });

    group('GetMyKidModeStatus', () {
      blocTest<AccountCubit, AccountState>(
        'Success',
        build: () {
          when(mockGetMyKidModeStatus.call()).thenAnswer(
            (_) async => const Right(true),
          );

          return bloc;
        },
        act: (bloc) => bloc.getMyKidModeStatus(),
        expect: () => [
          const AccountState.loading(),
          const AccountState.kidModeStatus(true),
        ],
        verify: (bloc) {
          verify(mockGetMyKidModeStatus.call()).called(1);
        },
      );

      blocTest<AccountCubit, AccountState>(
        'Failure',
        build: () {
          when(mockGetMyKidModeStatus.call()).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getMyKidModeStatus(),
        expect: () => [
          const AccountState.loading(),
          const AccountState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetMyKidModeStatus.call()).called(1);
        },
      );
    });

    group('SetMyKidModeStatusEvent', () {
      blocTest<AccountCubit, AccountState>(
        'Success',
        build: () {
          when(mockSetMyKidModeStatus.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.setMyKidModeStatus(true),
        expect: () => [
          const AccountState.loading(),
          const AccountState.kidModeStatusSet(),
        ],
        verify: (bloc) {
          verify(mockSetMyKidModeStatus.call(any)).called(1);
        },
      );

      blocTest<AccountCubit, AccountState>(
        'Failure',
        build: () {
          when(mockSetMyKidModeStatus.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.setMyKidModeStatus(true),
        expect: () => [
          const AccountState.loading(),
          const AccountState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockSetMyKidModeStatus.call(any)).called(1);
        },
      );
    });

    group('GetMyPreferences', () {
      blocTest<AccountCubit, AccountState>(
        'Success',
        build: () {
          when(mockGetMyPreferences.call()).thenAnswer(
            (_) async => const Right(UserPreferences()),
          );

          return bloc;
        },
        act: (bloc) => bloc.getMyPreferences(),
        expect: () => [
          const AccountState.loading(),
          const AccountState.myPreferences(UserPreferences()),
        ],
        verify: (bloc) {
          verify(mockGetMyPreferences.call()).called(1);
        },
      );

      blocTest<AccountCubit, AccountState>(
        'Failure',
        build: () {
          when(mockGetMyPreferences.call()).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getMyPreferences(),
        expect: () => [
          const AccountState.loading(),
          const AccountState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetMyPreferences.call()).called(1);
        },
      );
    });
  });
}
