import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/user_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/mockito.dart';

import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMSearchUsersByTerm mockSearchUsersByTerm;
  late MockMSearchUsernamesByTerm mockSearchUsernamesByTerm;
  late MockMGetRealtimeStatus mockGetRealtimeStatus;
  late MockMGetTop10Players mockGetTop10Players;
  late MockMGetChessVariantLeaderboard mockGetChessVariantLeaderboard;
  late MockMGetPublicData mockGetPublicData;
  late MockMGetRatingHistory mockGetRatingHistory;
  late MockMGetManyByIds mockGetManyByIds;
  late MockMGetLiveStreamers mockGetLiveStreamers;

  late UserCubit bloc;

  setUp(() {
    mockSearchUsersByTerm = MockMSearchUsersByTerm();
    mockSearchUsernamesByTerm = MockMSearchUsernamesByTerm();
    mockGetRealtimeStatus = MockMGetRealtimeStatus();
    mockGetTop10Players = MockMGetTop10Players();
    mockGetChessVariantLeaderboard = MockMGetChessVariantLeaderboard();
    mockGetPublicData = MockMGetPublicData();
    mockGetRatingHistory = MockMGetRatingHistory();
    mockGetManyByIds = MockMGetManyByIds();
    mockGetLiveStreamers = MockMGetLiveStreamers();

    bloc = UserCubit(
      getChessVariantLeaderboard: mockGetChessVariantLeaderboard,
      getLiveStreamers: mockGetLiveStreamers,
      getManyByIds: mockGetManyByIds,
      getUsernamesByTerm: mockSearchUsernamesByTerm,
      getPublicData: mockGetPublicData,
      getRatingHistory: mockGetRatingHistory,
      getRealtimeStatus: mockGetRealtimeStatus,
      getTop10Players: mockGetTop10Players,
      searchUsersByTerm: mockSearchUsersByTerm,
    );
  });

  group('Users', () {
    group('GetUsersByTerm', () {
      blocTest<UserCubit, UserState>(
        'Success',
        build: () {
          when(mockSearchUsersByTerm.call(any)).thenAnswer(
            (_) async => const Right(<User>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.searchUsersByTerm(term: ''),
        expect: () => [
          const UserState.loading(),
          const UserState.usersByTerm([]),
        ],
        verify: (bloc) {
          verify(mockSearchUsersByTerm.call(any)).called(1);
        },
      );

      blocTest<UserCubit, UserState>(
        'Failure',
        build: () {
          when(mockSearchUsersByTerm.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.searchUsersByTerm(term: ''),
        expect: () => [
          const UserState.loading(),
          const UserState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockSearchUsersByTerm.call(any)).called(1);
        },
      );
    });

    group('GetUsernamesByTerm', () {
      blocTest<UserCubit, UserState>(
        'Success',
        build: () {
          when(mockSearchUsernamesByTerm.call(any)).thenAnswer(
            (_) async => const Right(<String>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.getUsernamesByTerm(term: ''),
        expect: () => [
          const UserState.loading(),
          const UserState.usernamesByTerm([]),
        ],
        verify: (bloc) {
          verify(mockSearchUsernamesByTerm.call(any)).called(1);
        },
      );

      blocTest<UserCubit, UserState>(
        'Failure',
        build: () {
          when(mockSearchUsernamesByTerm.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getUsernamesByTerm(term: ''),
        expect: () => [
          const UserState.loading(),
          const UserState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockSearchUsernamesByTerm.call(any)).called(1);
        },
      );
    });

    group('GetRealtimeStatus', () {
      blocTest<UserCubit, UserState>(
        'Success',
        build: () {
          when(mockGetRealtimeStatus.call(any)).thenAnswer(
            (_) async => const Right(<RealTimeUserStatus>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.getRealtimeStatus(userIds: []),
        expect: () => [
          const UserState.loading(),
          const UserState.realtimeStatus([]),
        ],
        verify: (bloc) {
          verify(mockGetRealtimeStatus.call(any)).called(1);
        },
      );

      blocTest<UserCubit, UserState>(
        'Failure',
        build: () {
          when(mockGetRealtimeStatus.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getRealtimeStatus(userIds: []),
        expect: () => [
          const UserState.loading(),
          const UserState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetRealtimeStatus.call(any)).called(1);
        },
      );
    });
  });
}
