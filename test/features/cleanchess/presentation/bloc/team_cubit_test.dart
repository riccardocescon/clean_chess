import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/team_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/mockito.dart';

import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMGetTeamsByUser mockGetTeamsByUser;
  late MockMGetTeamById mockGetTeamById;
  late MockMGetTeamMembers mockGetTeamMembers;
  late MockMGetTeamJoinRequests mockGetTeamJoinRequests;
  late MockMAcceptJoinRequest mockAcceptJoinRequest;
  late MockMKickMemberFromTeam mockKickMemberFromTeam;
  late MockMDeclineJoinRequest mockDeclineJoinRequest;
  late MockMJoinTeam mockJoinTeam;
  late MockMLeaveTeam mockLeaveTeam;
  late MockMMessageAllMembers mockMessageAllMembers;
  late MockMSearchTeamByName mockSearchTeamByName;
  late MockMGetPopularTeams mockGetPopularTeams;

  late TeamCubit bloc;

  setUp(() {
    mockGetTeamsByUser = MockMGetTeamsByUser();
    mockGetTeamById = MockMGetTeamById();
    mockGetTeamMembers = MockMGetTeamMembers();
    mockGetTeamJoinRequests = MockMGetTeamJoinRequests();
    mockAcceptJoinRequest = MockMAcceptJoinRequest();
    mockKickMemberFromTeam = MockMKickMemberFromTeam();
    mockDeclineJoinRequest = MockMDeclineJoinRequest();
    mockJoinTeam = MockMJoinTeam();
    mockLeaveTeam = MockMLeaveTeam();
    mockMessageAllMembers = MockMMessageAllMembers();
    mockSearchTeamByName = MockMSearchTeamByName();
    mockGetPopularTeams = MockMGetPopularTeams();

    bloc = TeamCubit(
      acceptJoinRequest: mockAcceptJoinRequest,
      declineJoinRequest: mockDeclineJoinRequest,
      searchPopularTeams: mockGetPopularTeams,
      getTeamById: mockGetTeamById,
      getTeamJoinRequests: mockGetTeamJoinRequests,
      getTeamMembers: mockGetTeamMembers,
      getTeamsByUser: mockGetTeamsByUser,
      joinTeam: mockJoinTeam,
      kickMemberFromTeam: mockKickMemberFromTeam,
      leaveTeam: mockLeaveTeam,
      messageAllMembers: mockMessageAllMembers,
      searchTeamByName: mockSearchTeamByName,
    );
  });

  group('Teams', () {
    group('GetTeamsByUserEvent', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockGetTeamsByUser.call(any)).thenAnswer(
            (_) async => const Right([Team()]),
          );

          return bloc;
        },
        act: (bloc) => bloc.getTeamsByUserId(''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.teamsByUserId([]),
        ],
        verify: (bloc) {
          verify(mockGetTeamsByUser.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockGetTeamsByUser.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getTeamsByUserId(''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetTeamsByUser.call(any)).called(1);
        },
      );
    });

    group('GetTeamById', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockGetTeamById.call(any)).thenAnswer(
            (_) async => const Right(Team()),
          );

          return bloc;
        },
        act: (bloc) => bloc.getTeamById(''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.teamById(Team()),
        ],
        verify: (bloc) {
          verify(mockGetTeamById.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockGetTeamById.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getTeamById(''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetTeamById.call(any)).called(1);
        },
      );
    });

    group('GetTeamMembers', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockGetTeamMembers.call(any)).thenAnswer(
            (_) async => const Right([User()]),
          );

          return bloc;
        },
        act: (bloc) => bloc.getTeamMembers(teamId: '', maxMembers: 0),
        expect: () => [
          const TeamState.loading(),
          const TeamState.teamMembers([]),
        ],
        verify: (bloc) {
          verify(mockGetTeamMembers.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockGetTeamMembers.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getTeamMembers(teamId: '', maxMembers: 0),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetTeamMembers.call(any)).called(1);
        },
      );
    });

    group('GetTeamJoinRequests', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockGetTeamJoinRequests.call(any)).thenAnswer(
            (_) async => const Right([JoinRequest()]),
          );

          return bloc;
        },
        act: (bloc) => bloc.getTeamJoinRequests(teamId: '', maxRequests: 0),
        expect: () => [
          const TeamState.loading(),
          const TeamState.joinRequests([]),
        ],
        verify: (bloc) {
          verify(mockGetTeamJoinRequests.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockGetTeamJoinRequests.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getTeamJoinRequests(teamId: '', maxRequests: 0),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetTeamJoinRequests.call(any)).called(1);
        },
      );
    });

    group('AcceptJoinRequest', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockAcceptJoinRequest.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.acceptJoinRequest(teamId: '', userId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.joinRequestAccepted(),
        ],
        verify: (bloc) {
          verify(mockAcceptJoinRequest.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockAcceptJoinRequest.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.acceptJoinRequest(teamId: '', userId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockAcceptJoinRequest.call(any)).called(1);
        },
      );
    });

    group('KickMemberFromTeam', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockKickMemberFromTeam.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.kickMemberFromTeam(teamId: '', userId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.memberKicked(),
        ],
        verify: (bloc) {
          verify(mockKickMemberFromTeam.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockKickMemberFromTeam.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.kickMemberFromTeam(teamId: '', userId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockKickMemberFromTeam.call(any)).called(1);
        },
      );
    });

    group('DeclineJoinRequest', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockDeclineJoinRequest.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.declineJoinRequest(teamId: '', userId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.joinRequestRejected(),
        ],
        verify: (bloc) {
          verify(mockDeclineJoinRequest.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockDeclineJoinRequest.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.declineJoinRequest(teamId: '', userId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockDeclineJoinRequest.call(any)).called(1);
        },
      );
    });

    group('JoinTeam', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockJoinTeam.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.joinTeam(teamId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.joinedTeam(),
        ],
        verify: (bloc) {
          verify(mockJoinTeam.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockJoinTeam.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.joinTeam(teamId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockJoinTeam.call(any)).called(1);
        },
      );
    });

    group('LeaveTeam', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockLeaveTeam.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.leaveTeam(teamId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.leftTeam(),
        ],
        verify: (bloc) {
          verify(mockLeaveTeam.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockLeaveTeam.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.leaveTeam(teamId: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockLeaveTeam.call(any)).called(1);
        },
      );
    });

    group('MessageAllMembers', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockMessageAllMembers.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.messageAllMembers(teamId: '', message: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.messagedAllMembers(),
        ],
        verify: (bloc) {
          verify(mockMessageAllMembers.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockMessageAllMembers.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.messageAllMembers(teamId: '', message: ''),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockMessageAllMembers.call(any)).called(1);
        },
      );
    });

    group('SearchTeamByName', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockSearchTeamByName.call(any)).thenAnswer(
            (_) async => const Right(PageOf<Team>()),
          );

          return bloc;
        },
        act: (bloc) => bloc.searchTeamByName(name: '', page: 0),
        expect: () => [
          const TeamState.loading(),
          const TeamState.teamSearchedByName(PageOf<Team>()),
        ],
        verify: (bloc) {
          verify(mockSearchTeamByName.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockSearchTeamByName.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.searchTeamByName(name: '', page: 0),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockSearchTeamByName.call(any)).called(1);
        },
      );
    });

    group('GetPopularTeams', () {
      blocTest<TeamCubit, TeamState>(
        'Success',
        build: () {
          when(mockGetPopularTeams.call(any)).thenAnswer(
            (_) async => const Right(PageOf<Team>()),
          );

          return bloc;
        },
        act: (bloc) => bloc.getPopularTeams(page: 0),
        expect: () => [
          const TeamState.loading(),
          const TeamState.popularTeams(PageOf<Team>()),
        ],
        verify: (bloc) {
          verify(mockGetPopularTeams.call(any)).called(1);
        },
      );

      blocTest<TeamCubit, TeamState>(
        'Failure',
        build: () {
          when(mockGetPopularTeams.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.getPopularTeams(page: 0),
        expect: () => [
          const TeamState.loading(),
          const TeamState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockGetPopularTeams.call(any)).called(1);
        },
      );
    });
  });
}
