import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_datasource.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_tv_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_repositories.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/tv_repository.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/account/account.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth_lib.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_revoke_token.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/socials/socials.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/teams/teams.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/tv/stream_current_tv_game.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/users/users.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/tv_bloc.dart';
import 'package:get_it/get_it.dart';

import 'features/clean_chess/data/repositories/lichess/lichess_tv_repository.dart';
import 'features/clean_chess/domain/usecases/tv/get_current_tv_games.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Generics
  sl.registerLazySingleton<LichessTokenProvider>(() => LichessTokenProvider());

  // Register usecases
  sl.registerLazySingleton(() => LichessOAuth(sl<LichessOAuthRepository>()));
  sl.registerLazySingleton(
      () => LichessRevokeToken(sl<LichessOAuthRepository>()));
  sl.registerLazySingleton(
    () => LichessGainAccessToken(sl<LichessOAuthRepository>()),
  );
  sl.registerLazySingleton(() => GetMyProfile(sl<LichessAccountRepository>()));
  sl.registerLazySingleton(() => GetMyEmail(sl<LichessAccountRepository>()));
  sl.registerLazySingleton(
      () => GetMyKidModeStatus(sl<LichessAccountRepository>()));
  sl.registerLazySingleton(
    () => SetMyKidModeStatus(sl<LichessAccountRepository>()),
  );
  sl.registerLazySingleton(
    () => GetMyPreferences(sl<LichessAccountRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTeamsByUser(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTeamById(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTeamMembers(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTeamJoinRequests(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => AcceptJoinRequest(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => DeclineJoinRequest(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => KickMemberFromTeam(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => JoinTeam(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => LeaveTeam(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => MessageAllMembers(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => SearchTeamByName(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => GetPopularTeams(sl<LichessTeamRepository>()),
  );
  sl.registerLazySingleton(
    () => SearchUserByTerm(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => SearchUsernamesByTerm(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => GetRealtimeStatus(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => GetTop10Players(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => GetChessVariantLeaderboard(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => GetPublicData(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => GetRatingHistory(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => GetManyByIds(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => GetLiveStreamers(sl<LichessUserRepository>()),
  );
  sl.registerLazySingleton(
    () => GetFollowingUsers(sl<LichessSocialRepository>()),
  );
  sl.registerLazySingleton(
    () => FollowUser(sl<LichessSocialRepository>()),
  );
  sl.registerLazySingleton(
    () => UnfollowUser(sl<LichessSocialRepository>()),
  );
  sl.registerLazySingleton<TvRepository>(
    () => LichessTvRepository(
      sl<LichessTvDataSource>(),
    ),
  );
  sl.registerLazySingleton<GetCurrentTvGames>(
    () => GetCurrentTvGames(sl<TvRepository>()),
  );
  sl.registerLazySingleton<StreamCurrentTvGames>(
    () => StreamCurrentTvGames(sl<TvRepository>()),
  );

  // Register repositories
  sl.registerLazySingleton<LichessOAuthRepository>(
    () => LichessOAuthRepository(
      oAuthDataSource: sl<LichessOAuthDataSource>(),
    ),
  );
  sl.registerLazySingleton<LichessAccountRepository>(
    () => LichessAccountRepository(
      remoteDataSource: sl<LichessAccountDataSource>(),
    ),
  );
  sl.registerLazySingleton<LichessTeamRepository>(
    () => LichessTeamRepository(
      teamDataSource: sl<LichessTeamDataSource>(),
    ),
  );
  sl.registerLazySingleton<LichessUserRepository>(
    () => LichessUserRepository(
      dataSource: sl<LichessUserDataSource>(),
    ),
  );
  sl.registerLazySingleton<LichessSocialRepository>(
    () => LichessSocialRepository(
      socialDataSource: sl<LichessSocialDataSource>(),
    ),
  );

  // Register data sources
  sl.registerLazySingleton<LichessOAuthDataSource>(
    () => LichessOAuthDataSource(),
  );
  sl.registerLazySingleton<LichessAccountDataSource>(
    () => LichessAccountDataSource(sl<LichessTokenProvider>()),
  );
  sl.registerLazySingleton<LichessTeamDataSource>(
    () => LichessTeamDataSource(sl<LichessTokenProvider>()),
  );
  sl.registerLazySingleton<LichessUserDataSource>(
    () => LichessUserDataSource(sl<LichessTokenProvider>()),
  );
  sl.registerLazySingleton<LichessSocialDataSource>(
    () => LichessSocialDataSource(sl<LichessTokenProvider>()),
  );
  sl.registerLazySingleton<LichessTvDataSource>(
    () => LichessTvDataSource(sl<LichessTokenProvider>()),
  );

  // Register bloc
  sl.registerLazySingleton(
    () => ServerBloc(
      tokenProvider: sl<LichessTokenProvider>(),
      revokeToken: sl<LichessRevokeToken>(),
      oauth: sl<LichessOAuth>(),
      gainAccessToken: sl<LichessGainAccessToken>(),
      getMyProfile: sl<GetMyProfile>(),
      getMyEmail: sl<GetMyEmail>(),
      getMyKidModeStatus: sl<GetMyKidModeStatus>(),
      setMyKidModeStatus: sl<SetMyKidModeStatus>(),
      getMyPreferences: sl<GetMyPreferences>(),
      getTeamsByUser: sl<GetTeamsByUser>(),
      getTeamById: sl<GetTeamById>(),
      getTeamMembers: sl<GetTeamMembers>(),
      getTeamJoinRequests: sl<GetTeamJoinRequests>(),
      acceptJoinRequest: sl<AcceptJoinRequest>(),
      declineJoinRequest: sl<DeclineJoinRequest>(),
      kickMemberFromTeam: sl<KickMemberFromTeam>(),
      joinTeam: sl<JoinTeam>(),
      leaveTeam: sl<LeaveTeam>(),
      messageAllMembers: sl<MessageAllMembers>(),
      searchTeamByName: sl<SearchTeamByName>(),
      searchPopularTeams: sl<GetPopularTeams>(),
      searchUsersByTerm: sl<SearchUserByTerm>(),
      getUsernamesByTerm: sl<SearchUsernamesByTerm>(),
      getRealtimeStatus: sl<GetRealtimeStatus>(),
      getTop10Players: sl<GetTop10Players>(),
      getChessVariantLeaderboard: sl<GetChessVariantLeaderboard>(),
      getPublicData: sl<GetPublicData>(),
      getRatingHistory: sl<GetRatingHistory>(),
      getManyByIds: sl<GetManyByIds>(),
      getLiveStreamers: sl<GetLiveStreamers>(),
      getFollowingUsers: sl<GetFollowingUsers>(),
      followUser: sl<FollowUser>(),
      unfollowUser: sl<UnfollowUser>(),
      getCurrentTvGames: sl<GetCurrentTvGames>(),
      streamCurrentTvGames: sl<StreamCurrentTvGames>(),
    ),
  );

  // Standalone Blocs...
  sl.registerLazySingleton<TvGameStreamBloc>(
    () => TvGameStreamBloc(tvRepository: sl<TvRepository>()),
  );
}
