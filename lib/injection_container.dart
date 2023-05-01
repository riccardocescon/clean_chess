import 'package:cleanchess/core/presentation/bloc/utilities/cubit_helper.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_board_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_datasource.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_game_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_puzzle_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/lichess/lichess_tv_data_source.dart';
import 'package:cleanchess/features/clean_chess/data/models/user_settings_model.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_board_repository.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_game_repository.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_puzzle_repository.dart';
import 'package:cleanchess/features/clean_chess/data/repositories/lichess/lichess_repositories.dart';
import 'package:cleanchess/features/clean_chess/domain/repositories/tv_repository.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/account/account.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/board/board.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/game/game.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth_lib.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_revoke_token.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/socials/socials.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/teams/teams.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/users/users.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/account_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/auth_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/board_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/game_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/in_game/puzzle_mode_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/puzzle_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/social_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/team_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/tv_game_stream_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/user_cubit.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/puzzle/puzzle.dart';
import 'package:get_it/get_it.dart';

import 'features/clean_chess/data/repositories/lichess/lichess_tv_repository.dart';
import 'features/clean_chess/domain/usecases/tv/get_current_tv_games.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Generics
  sl.registerLazySingleton<LichessTokenProvider>(() => LichessTokenProvider());
  sl.registerLazySingleton<CubitHelper>(() => CubitHelper());
  sl.registerLazySingleton<PuzzleModeCubit>(() => PuzzleModeCubit());
  sl.registerLazySingleton<UserSettingsModel>(() => UserSettingsModel.none());

  sl.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      oauth: sl<LichessOAuth>(),
      gainAccessToken: sl<LichessGainAccessToken>(),
      revokeToken: sl<LichessRevokeToken>(),
      tokenProvider: sl<LichessTokenProvider>(),
    ),
  );
  sl.registerLazySingleton<AccountCubit>(
    () => AccountCubit(
      getMyProfile: sl<GetMyProfile>(),
      getMyEmail: sl<GetMyEmail>(),
      getKidModeStatus: sl<GetMyKidModeStatus>(),
      setKidModeStatus: sl<SetMyKidModeStatus>(),
      getMyPreferences: sl<GetMyPreferences>(),
    ),
  );
  sl.registerLazySingleton<SocialCubit>(
    () => SocialCubit(
      followUser: sl<FollowUser>(),
      unfollowUser: sl<UnfollowUser>(),
      getFollowingUsers: sl<GetFollowingUsers>(),
    ),
  );
  sl.registerLazySingleton<TeamCubit>(
    () => TeamCubit(
      acceptJoinRequest: sl<AcceptJoinRequest>(),
      declineJoinRequest: sl<DeclineJoinRequest>(),
      getTeamById: sl<GetTeamById>(),
      getTeamJoinRequests: sl<GetTeamJoinRequests>(),
      getTeamMembers: sl<GetTeamMembers>(),
      getTeamsByUser: sl<GetTeamsByUser>(),
      kickMemberFromTeam: sl<KickMemberFromTeam>(),
      joinTeam: sl<JoinTeam>(),
      leaveTeam: sl<LeaveTeam>(),
      messageAllMembers: sl<MessageAllMembers>(),
      searchTeamByName: sl<SearchTeamByName>(),
      searchPopularTeams: sl<GetPopularTeams>(),
    ),
  );
  sl.registerLazySingleton<UserCubit>(
    () => UserCubit(
      getChessVariantLeaderboard: sl<GetChessVariantLeaderboard>(),
      getLiveStreamers: sl<GetLiveStreamers>(),
      getManyByIds: sl<GetManyByIds>(),
      getPublicData: sl<GetPublicData>(),
      getRatingHistory: sl<GetRatingHistory>(),
      getRealtimeStatus: sl<GetRealtimeStatus>(),
      getTop10Players: sl<GetTop10Players>(),
      getUsernamesByTerm: sl<SearchUsernamesByTerm>(),
      searchUsersByTerm: sl<SearchUserByTerm>(),
    ),
  );
  sl.registerLazySingleton<PuzzleCubit>(
    () => PuzzleCubit(
      getDailyPuzzle: sl<GetDailyPuzzle>(),
      getPuzzleById: sl<GetPuzzleById>(),
      getPuzzleActivity: sl<GetPuzzleActivity>(),
      getPuzzleDashboard: sl<GetPuzzleDashboard>(),
    ),
  );
  sl.registerLazySingleton<GameCubit>(
    () => GameCubit(
      exportGame: sl<ExportGame>(),
      exportGamesOfUser: sl<ExportGamesOfUser>(),
    ),
  );
  sl.registerLazySingleton<BoardCubit>(
    () => BoardCubit(
      createRealTimeSeek: sl<CreateRealTimeSeek>(),
      createCorrespondenceSeek: sl<CreateCorrespondenceSeek>(),
      abortGame: sl<AbortGame>(),
      claimVictory: sl<ClaimVictory>(),
      fetchGameChat: sl<FetchGameChat>(),
      writeOnGameChat: sl<WriteOnGameChat>(),
      resignGame: sl<ResignGame>(),
      makeMove: sl<MakeMove>(),
      streamBoardGameState: sl<StreamBoardGameState>(),
      streamIncomingEvents: sl<StreamIncomingEvents>(),
    ),
  );

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
  sl.registerLazySingleton(() => GetDailyPuzzle(sl<LichessPuzzleRepository>()));
  sl.registerLazySingleton(() => GetPuzzleById(sl<LichessPuzzleRepository>()));
  sl.registerLazySingleton(
    () => GetPuzzleActivity(sl<LichessPuzzleRepository>()),
  );
  sl.registerLazySingleton(
    () => GetPuzzleDashboard(sl<LichessPuzzleRepository>()),
  );
  sl.registerLazySingleton(() => ExportGame(sl<LichessGameRepository>()));
  sl.registerLazySingleton(
    () => ExportGamesOfUser(sl<LichessGameRepository>()),
  );
  sl.registerLazySingleton(() => sl<CreateRealTimeSeek>());
  sl.registerLazySingleton(() => sl<CreateCorrespondenceSeek>());
  sl.registerLazySingleton(() => sl<AbortGame>());
  sl.registerLazySingleton(() => sl<ClaimVictory>());
  sl.registerLazySingleton(() => sl<FetchGameChat>());
  sl.registerLazySingleton(() => sl<WriteOnGameChat>());
  sl.registerLazySingleton(() => sl<ResignGame>());
  sl.registerLazySingleton(() => sl<MakeMove>());
  sl.registerLazySingleton(() => sl<StreamBoardGameState>());
  sl.registerLazySingleton(() => sl<StreamIncomingEvents>());

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
  sl.registerLazySingleton<LichessPuzzleRepository>(
    () => LichessPuzzleRepository(
      sl<LichessPuzzleDataSource>(),
    ),
  );
  sl.registerLazySingleton<LichessGameRepository>(
    () => LichessGameRepository(
      sl<LichessGameDataSource>(),
    ),
  );
  sl.registerLazySingleton<LichessBoardRepository>(
    () => LichessBoardRepository(
      sl<LichessBoardDataSource>(),
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
  sl.registerLazySingleton<LichessPuzzleDataSource>(
    () => LichessPuzzleDataSource(sl<LichessTokenProvider>()),
  );
  sl.registerLazySingleton<LichessGameDataSource>(
    () => LichessGameDataSource(sl<LichessTokenProvider>()),
  );
  sl.registerLazySingleton<LichessBoardDataSource>(
    () => LichessBoardDataSource(sl<LichessTokenProvider>()),
  );

  // Standalone Blocs...
  sl.registerLazySingleton<TvGameStreamCubit>(
    () => TvGameStreamCubit(tvRepository: sl<TvRepository>()),
  );

  await sl<AuthCubit>().loadInitialState();
}
