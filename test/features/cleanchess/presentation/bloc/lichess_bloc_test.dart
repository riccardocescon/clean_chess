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
  late MockMSearchUsersByTerm mockSearchUsersByTerm;
  late MockMSearchUsernamesByTerm mockSearchUsernamesByTerm;
  late MockMGetRealtimeStatus mockGetRealtimeStatus;
  late MockMGetTop10Players mockGetTop10Players;
  late MockMGetChessVariantLeaderboard mockGetChessVariantLeaderboard;
  late MockMGetPublicData mockGetPublicData;
  late MockMGetRatingHistory mockGetRatingHistory;
  late MockMGetManyByIds mockGetManyByIds;
  late MockMGetLiveStreamers mockGetLiveStreamers;
  late MockMGetFollowingUsers mockGetFollowingUsers;
  late MockMFollowUser mockFollowUser;

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
    mockGetTeamsByUser = MockMGetTeamsByUser();
    mockGetTeamById = MockMGetTeamById();
    mockGetTeamMembers = MockMGetTeamMembers();
    mockGetTeamJoinRequests = MockMGetTeamJoinRequests();
    mockAcceptJoinRequest = MockMAcceptJoinRequest();
    mockDeclineJoinRequest = MockMDeclineJoinRequest();
    mockKickMemberFromTeam = MockMKickMemberFromTeam();
    mockJoinTeam = MockMJoinTeam();
    mockLeaveTeam = MockMLeaveTeam();
    mockMessageAllMembers = MockMMessageAllMembers();
    mockSearchTeamByName = MockMSearchTeamByName();
    mockGetPopularTeams = MockMGetPopularTeams();
    mockSearchUsersByTerm = MockMSearchUsersByTerm();
    mockSearchUsernamesByTerm = MockMSearchUsernamesByTerm();
    mockGetRealtimeStatus = MockMGetRealtimeStatus();
    mockGetTop10Players = MockMGetTop10Players();
    mockGetChessVariantLeaderboard = MockMGetChessVariantLeaderboard();
    mockGetPublicData = MockMGetPublicData();
    mockGetRatingHistory = MockMGetRatingHistory();
    mockGetManyByIds = MockMGetManyByIds();
    mockGetLiveStreamers = MockMGetLiveStreamers();
    mockGetFollowingUsers = MockMGetFollowingUsers();
    mockFollowUser = MockMFollowUser();

    bloc = LichessBloc(
      tokenProvider: mockLichessTokenProvider,
      oauth: mockLichessOAuth,
      gainAccessToken: mockLichessGainAccessToken,
      getMyProfile: mockGetMyProfile,
      getMyEmail: mockGetMyEmail,
      getMyKidModeStatus: mockGetMyKidModeStatus,
      setMyKidModeStatus: mockSetMyKidModeStatus,
      getMyPreferences: mockGetMyPreferences,
      getTeamsByUser: mockGetTeamsByUser,
      getTeamById: mockGetTeamById,
      getTeamMembers: mockGetTeamMembers,
      getTeamJoinRequests: mockGetTeamJoinRequests,
      acceptJoinRequest: mockAcceptJoinRequest,
      declineJoinRequest: mockDeclineJoinRequest,
      kickMemberFromTeam: mockKickMemberFromTeam,
      joinTeam: mockJoinTeam,
      leaveTeam: mockLeaveTeam,
      messageAllMembers: mockMessageAllMembers,
      searchTeamByName: mockSearchTeamByName,
      searchPopularTeams: mockGetPopularTeams,
      searchUsersByTerm: mockSearchUsersByTerm,
      getUsernamesByTerm: mockSearchUsernamesByTerm,
      getRealtimeStatus: mockGetRealtimeStatus,
      getTop10Players: mockGetTop10Players,
      getChessVariantLeaderboard: mockGetChessVariantLeaderboard,
      getPublicData: mockGetPublicData,
      getRatingHistory: mockGetRatingHistory,
      getManyByIds: mockGetManyByIds,
      getLiveStreamers: mockGetLiveStreamers,
      getFollowingUsers: mockGetFollowingUsers,
      followUser: mockFollowUser,
    );
  });

  group('OAuth', () {
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
  });

  group('Account', () {
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
  });

  group('Teams', () {
    group('GetTeamsByUserEvent', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockGetTeamsByUser.call(any)).thenAnswer(
            (_) async => const Right([Team()]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTeamsByUserIdEvent(userId: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<Team>>>(),
        ],
        verify: (bloc) {
          verify(mockGetTeamsByUser.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockGetTeamsByUser.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTeamsByUserIdEvent(userId: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetTeamsByUser.call(any)).called(1);
        },
      );
    });

    group('GetTeamById', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockGetTeamById.call(any)).thenAnswer(
            (_) async => const Right(Team()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTeamByIdEvent(teamId: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<Team>>(),
        ],
        verify: (bloc) {
          verify(mockGetTeamById.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockGetTeamById.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTeamByIdEvent(teamId: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetTeamById.call(any)).called(1);
        },
      );
    });

    group('GetTeamMembers', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockGetTeamMembers.call(any)).thenAnswer(
            (_) async => const Right([User()]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTeamMembersEvent(teamId: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<User>>>(),
        ],
        verify: (bloc) {
          verify(mockGetTeamMembers.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockGetTeamMembers.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTeamMembersEvent(teamId: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetTeamMembers.call(any)).called(1);
        },
      );
    });

    group('GetTeamJoinRequests', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockGetTeamJoinRequests.call(any)).thenAnswer(
            (_) async => const Right([JoinRequest()]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTeamJoinRequestsEvent(teamId: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<JoinRequest>>>(),
        ],
        verify: (bloc) {
          verify(mockGetTeamJoinRequests.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockGetTeamJoinRequests.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTeamJoinRequestsEvent(teamId: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetTeamJoinRequests.call(any)).called(1);
        },
      );
    });

    group('AcceptJoinRequest', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockAcceptJoinRequest.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const AcceptJoinRequestEvent(
            teamId: '',
            userId: '',
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<Empty>>(),
        ],
        verify: (bloc) {
          verify(mockAcceptJoinRequest.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockAcceptJoinRequest.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const AcceptJoinRequestEvent(
          teamId: '',
          userId: '',
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockAcceptJoinRequest.call(any)).called(1);
        },
      );
    });

    group('KickMemberFromTeam', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockKickMemberFromTeam.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const KickMemberFromTeamEvent(
            teamId: '',
            userId: '',
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<Empty>>(),
        ],
        verify: (bloc) {
          verify(mockKickMemberFromTeam.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockKickMemberFromTeam.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const KickMemberFromTeamEvent(
          teamId: '',
          userId: '',
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockKickMemberFromTeam.call(any)).called(1);
        },
      );
    });

    group('DeclineJoinRequest', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockDeclineJoinRequest.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const DeclineJoinRequestEvent(
            teamId: '',
            userId: '',
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<Empty>>(),
        ],
        verify: (bloc) {
          verify(mockDeclineJoinRequest.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockDeclineJoinRequest.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const DeclineJoinRequestEvent(
          teamId: '',
          userId: '',
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockDeclineJoinRequest.call(any)).called(1);
        },
      );
    });

    group('JoinTeam', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockJoinTeam.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const JoinTeamEvent(
            teamId: '',
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<Empty>>(),
        ],
        verify: (bloc) {
          verify(mockJoinTeam.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockJoinTeam.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const JoinTeamEvent(
          teamId: '',
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockJoinTeam.call(any)).called(1);
        },
      );
    });

    group('LeaveTeam', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockLeaveTeam.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const LeaveTeamEvent(
            teamId: '',
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<Empty>>(),
        ],
        verify: (bloc) {
          verify(mockLeaveTeam.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockLeaveTeam.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const LeaveTeamEvent(
          teamId: '',
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockLeaveTeam.call(any)).called(1);
        },
      );
    });

    group('MessageAllMembers', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockMessageAllMembers.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const MessageAllMembersEvent(
            teamId: '',
            message: '',
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<Empty>>(),
        ],
        verify: (bloc) {
          verify(mockMessageAllMembers.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockMessageAllMembers.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const MessageAllMembersEvent(
          teamId: '',
          message: '',
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockMessageAllMembers.call(any)).called(1);
        },
      );
    });

    group('SearchTeamByName', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockSearchTeamByName.call(any)).thenAnswer(
            (_) async => const Right(PageOf<Team>()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const SearchTeamByNameEvent(teamName: ''),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<PageOf<Team>>>(),
        ],
        verify: (bloc) {
          verify(mockSearchTeamByName.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockSearchTeamByName.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const SearchTeamByNameEvent(teamName: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockSearchTeamByName.call(any)).called(1);
        },
      );
    });

    group('GetPopularTeams', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockGetPopularTeams.call(any)).thenAnswer(
            (_) async => const Right(PageOf<Team>()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetPopularTeamsEvent()),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<PageOf<Team>>>(),
        ],
        verify: (bloc) {
          verify(mockGetPopularTeams.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockGetPopularTeams.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetPopularTeamsEvent()),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetPopularTeams.call(any)).called(1);
        },
      );
    });
  });

  group('Users', () {
    group('GetUsersByTerm', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockSearchUsersByTerm.call(any)).thenAnswer(
            (_) async => const Right(<User>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const SearchUsersByTermEvent(
            term: '',
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<User>>>(),
        ],
        verify: (bloc) {
          verify(mockSearchUsersByTerm.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockSearchUsersByTerm.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const SearchUsersByTermEvent(
          term: '',
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockSearchUsersByTerm.call(any)).called(1);
        },
      );
    });

    group('GetUsernamesByTerm', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockSearchUsernamesByTerm.call(any)).thenAnswer(
            (_) async => const Right(<String>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const SearchUsernamesByTermEvent(
            term: '',
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<String>>>(),
        ],
        verify: (bloc) {
          verify(mockSearchUsernamesByTerm.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockSearchUsernamesByTerm.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const SearchUsernamesByTermEvent(
          term: '',
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockSearchUsernamesByTerm.call(any)).called(1);
        },
      );
    });

    group('GetRealtimeStatus', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockGetRealtimeStatus.call(any)).thenAnswer(
            (_) async => const Right(<RealTimeUserStatus>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const GetRealtimeStatusEvent(
            ids: [],
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<RealTimeUserStatus>>>(),
        ],
        verify: (bloc) {
          verify(mockGetRealtimeStatus.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockGetRealtimeStatus.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetRealtimeStatusEvent(
          ids: [],
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetRealtimeStatus.call(any)).called(1);
        },
      );
    });

    group('GetTop10Players', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockGetTop10Players.call(any)).thenAnswer(
            (_) async => const Right(<String, List<User>>{}),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const GetTop10PlayersEvent(),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<Map<String, List<User>>>>(),
        ],
        verify: (bloc) {
          verify(mockGetTop10Players.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockGetTop10Players.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetTop10PlayersEvent()),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetTop10Players.call(any)).called(1);
        },
      );
    });

    group('GetChessVariantLeaderboard', () {
      blocTest<LichessBloc, LichessState>(
        'Success',
        build: () {
          when(mockGetChessVariantLeaderboard.call(any)).thenAnswer(
            (_) async => const Right(<User>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(
          const GetChessVariantLeaderboardEvent(
            perfType: PerfType.classical,
          ),
        ),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<User>>>(),
        ],
        verify: (bloc) {
          verify(mockGetChessVariantLeaderboard.call(any)).called(1);
        },
      );

      blocTest<LichessBloc, LichessState>(
        'Failure',
        build: () {
          when(mockGetChessVariantLeaderboard.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetChessVariantLeaderboardEvent(
          perfType: PerfType.classical,
        )),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetChessVariantLeaderboard.call(any)).called(1);
        },
      );
    });

    group('GetPublicData', () {
      blocTest(
        'Success',
        build: () {
          when(mockGetPublicData.call(any)).thenAnswer(
            (_) async => const Right(User()),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetPublicDataEvent(username: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<User>>(),
        ],
        verify: (bloc) {
          verify(mockGetPublicData.call(any)).called(1);
        },
      );
      blocTest(
        'Failure',
        build: () {
          when(mockGetPublicData.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetPublicDataEvent(username: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetPublicData.call(any)).called(1);
        },
      );
    });

    group('GetRatingHistory', () {
      blocTest(
        'Success',
        build: () {
          when(mockGetRatingHistory.call(any)).thenAnswer(
            (_) async => const Right(<RatingHistory>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetRatingHistoryEvent(username: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<RatingHistory>>>(),
        ],
        verify: (bloc) {
          verify(mockGetRatingHistory.call(any)).called(1);
        },
      );
      blocTest(
        'Failure',
        build: () {
          when(mockGetRatingHistory.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetRatingHistoryEvent(username: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetRatingHistory.call(any)).called(1);
        },
      );
    });

    group('GetManyByIds', () {
      blocTest(
        'Success',
        build: () {
          when(mockGetManyByIds.call(any)).thenAnswer(
            (_) async => const Right(<User>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetManyByIdsEvent(ids: [])),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<User>>>(),
        ],
        verify: (bloc) {
          verify(mockGetManyByIds.call(any)).called(1);
        },
      );
      blocTest(
        'Failure',
        build: () {
          when(mockGetManyByIds.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetManyByIdsEvent(ids: [])),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetManyByIds.call(any)).called(1);
        },
      );
    });

    group('GetLiveStreamers', () {
      blocTest(
        'Success',
        build: () {
          when(mockGetLiveStreamers.call(any)).thenAnswer(
            (_) async => const Right(<User>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetLiveStreamersEvent()),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<User>>>(),
        ],
        verify: (bloc) {
          verify(mockGetLiveStreamers.call(any)).called(1);
        },
      );
      blocTest(
        'Failure',
        build: () {
          when(mockGetLiveStreamers.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetLiveStreamersEvent()),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetLiveStreamers.call(any)).called(1);
        },
      );
    });

    group('GetFollowingUsers', () {
      blocTest(
        'Success',
        build: () {
          when(mockGetFollowingUsers.call(any)).thenAnswer(
            (_) async => const Right(<User>[]),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetFollowingUsersEvent()),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<List<User>>>(),
        ],
        verify: (bloc) {
          verify(mockGetFollowingUsers.call(any)).called(1);
        },
      );
      blocTest(
        'Failure',
        build: () {
          when(mockGetFollowingUsers.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const GetFollowingUsersEvent()),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockGetFollowingUsers.call(any)).called(1);
        },
      );
    });

    group('FollowUser', () {
      blocTest(
        'Success',
        build: () {
          when(mockFollowUser.call(any)).thenAnswer(
            (_) async => const Right(true),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const FollowUserEvent(username: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessLoaded<bool>>(),
        ],
        verify: (bloc) {
          verify(mockFollowUser.call(any)).called(1);
        },
      );

      blocTest(
        'failure',
        build: () {
          when(mockFollowUser.call(any)).thenAnswer(
            (_) async => Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.add(const FollowUserEvent(username: '')),
        expect: () => [
          isA<LichessLoading>(),
          isA<LichessError>(),
        ],
        verify: (bloc) {
          verify(mockFollowUser.call(any)).called(1);
        },
      );
    });
  });
}
