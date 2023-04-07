import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/social_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/mockito.dart';

import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMGetFollowingUsers mockGetFollowingUsers;
  late MockMFollowUser mockFollowUser;
  late MockMUnfollowUser mockUnfollowUser;

  late SocialCubit bloc;

  setUp(() {
    mockGetFollowingUsers = MockMGetFollowingUsers();
    mockFollowUser = MockMFollowUser();
    mockUnfollowUser = MockMUnfollowUser();

    bloc = SocialCubit(
      followUser: mockFollowUser,
      getFollowingUsers: mockGetFollowingUsers,
      unfollowUser: mockUnfollowUser,
    );
  });

  group('Social', () {
    group('GetFollowingUsers', () {
      blocTest<SocialCubit, SocialState>(
        'Success',
        build: () {
          when(mockGetFollowingUsers.call()).thenAnswer(
            (_) async => const Right(<User>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.getFollowingUsers(),
        expect: () => [
          const SocialState.loading(),
          const SocialState.followingUsers([]),
        ],
        verify: (bloc) {
          verify(mockGetFollowingUsers.call()).called(1);
        },
      );
      blocTest<SocialCubit, SocialState>(
        'Failure',
        build: () {
          when(mockGetFollowingUsers.call()).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getFollowingUsers(),
        expect: () => [
          const SocialState.loading(),
          const SocialState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetFollowingUsers.call()).called(1);
        },
      );
    });
    group('FollowUser', () {
      blocTest<SocialCubit, SocialState>(
        'Success',
        build: () {
          when(mockFollowUser.call(any)).thenAnswer(
            (_) async => const Right(true),
          );

          return bloc;
        },
        act: (bloc) => bloc.followUser(''),
        expect: () => [
          const SocialState.loading(),
          const SocialState.userFollowed(),
        ],
        verify: (bloc) {
          verify(mockFollowUser.call(any)).called(1);
        },
      );

      blocTest<SocialCubit, SocialState>(
        'failure',
        build: () {
          when(mockFollowUser.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.followUser(''),
        expect: () => [
          const SocialState.loading(),
          const SocialState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockFollowUser.call(any)).called(1);
        },
      );
    });

    group('UnfollowUser', () {
      blocTest<SocialCubit, SocialState>(
        'Success',
        build: () {
          when(mockUnfollowUser.call(any)).thenAnswer(
            (_) async => const Right(true),
          );

          return bloc;
        },
        act: (bloc) => bloc.unfollowUser(''),
        expect: () => [
          const SocialState.loading(),
          const SocialState.userUnfollowed(),
        ],
        verify: (bloc) {
          verify(mockUnfollowUser.call(any)).called(1);
        },
      );

      blocTest<SocialCubit, SocialState>(
        'failure',
        build: () {
          when(mockUnfollowUser.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.unfollowUser(''),
        expect: () => [
          const SocialState.loading(),
          const SocialState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockUnfollowUser.call(any)).called(1);
        },
      );
    });
  });
}
