import 'package:cleanchess/features/clean_chess/domain/usecases/account/account.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/board/board.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/game/game.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth_lib.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_revoke_token.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/puzzle/puzzle.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/socials/socials.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/teams/teams.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/tv/get_current_tv_games.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/users/users.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

class MLichessOAuth extends Mock implements LichessOAuth {}

class MLichessRevokeToken extends Mock implements LichessRevokeToken {}

class MLichessGainAccessToken extends Mock implements LichessGainAccessToken {}

class MGetMyProfile extends Mock implements GetMyProfile {}

class MGetMyEmail extends Mock implements GetMyEmail {}

class MGetMyKidModeStatus extends Mock implements GetMyKidModeStatus {}

class MSetMyKidModeStatus extends Mock implements SetMyKidModeStatus {}

class MGetMyPreferences extends Mock implements GetMyPreferences {}

class MGetTeamsByUser extends Mock implements GetTeamsByUser {}

class MGetTeamById extends Mock implements GetTeamById {}

class MGetTeamMembers extends Mock implements GetTeamMembers {}

class MGetTeamJoinRequests extends Mock implements GetTeamJoinRequests {}

class MAcceptJoinRequest extends Mock implements AcceptJoinRequest {}

class MDeclineJoinRequest extends Mock implements DeclineJoinRequest {}

class MKickMemberFromTeam extends Mock implements KickMemberFromTeam {}

class MJoinTeam extends Mock implements JoinTeam {}

class MLeaveTeam extends Mock implements LeaveTeam {}

class MMessageAllMembers extends Mock implements MessageAllMembers {}

class MSearchTeamByName extends Mock implements SearchTeamByName {}

class MGetPopularTeams extends Mock implements GetPopularTeams {}

class MSearchUsersByTerm extends Mock implements SearchUserByTerm {}

class MSearchUsernamesByTerm extends Mock implements SearchUsernamesByTerm {}

class MGetRealtimeStatus extends Mock implements GetRealtimeStatus {}

class MGetTop10Players extends Mock implements GetTop10Players {}

class MGetPublicData extends Mock implements GetPublicData {}

class MGetChessVariantLeaderboard extends Mock
    implements GetChessVariantLeaderboard {}

class MGetRatingHistory extends Mock implements GetRatingHistory {}

class MGetManyByIds extends Mock implements GetManyByIds {}

class MGetLiveStreamers extends Mock implements GetLiveStreamers {}

class MGetFollowingUsers extends Mock implements GetFollowingUsers {}

class MFollowUser extends Mock implements FollowUser {}

class MUnfollowUser extends Mock implements UnfollowUser {}

class MGetCurrentTvGames extends Mock implements GetCurrentTvGames {}

class MGetDailyPuzzle extends Mock implements GetDailyPuzzle {}

class MGetPuzzleById extends Mock implements GetPuzzleById {}

class MGetPuzzleActivity extends Mock implements GetPuzzleActivity {}

class MGetPuzzleDashboard extends Mock implements GetPuzzleDashboard {}

class MExportGame extends Mock implements ExportGame {}

class MExportGamesOfUser extends Mock implements ExportGamesOfUser {}

class MCreateRealTimeSeek extends Mock implements CreateRealTimeSeek {}

class MCreateCorrespondenceSeek extends Mock
    implements CreateCorrespondenceSeek {}

class MAbortGame extends Mock implements AbortGame {}

class MClaimVictory extends Mock implements ClaimVictory {}

class MFetchGameChat extends Mock implements FetchGameChat {}

class MWriteOnGameChat extends Mock implements WriteOnGameChat {}

class MResignGame extends Mock implements ResignGame {}

class MMakeMove extends Mock implements MakeMove {}

class MStreamBoardGameState extends Mock implements StreamBoardGameState {}

class MStreamIncomingEvents extends Mock implements StreamIncomingEvents {}

@GenerateNiceMocks([
  MockSpec<MLichessOAuth>(),
  MockSpec<MLichessRevokeToken>(),
  MockSpec<MLichessGainAccessToken>(),
  MockSpec<MGetMyProfile>(),
  MockSpec<MGetMyEmail>(),
  MockSpec<MGetMyKidModeStatus>(),
  MockSpec<MSetMyKidModeStatus>(),
  MockSpec<MGetMyPreferences>(),
  MockSpec<MGetTeamsByUser>(),
  MockSpec<MGetTeamById>(),
  MockSpec<MGetTeamMembers>(),
  MockSpec<MGetTeamJoinRequests>(),
  MockSpec<MAcceptJoinRequest>(),
  MockSpec<MDeclineJoinRequest>(),
  MockSpec<MKickMemberFromTeam>(),
  MockSpec<MJoinTeam>(),
  MockSpec<MLeaveTeam>(),
  MockSpec<MMessageAllMembers>(),
  MockSpec<MSearchTeamByName>(),
  MockSpec<MGetPopularTeams>(),
  MockSpec<MSearchUsersByTerm>(),
  MockSpec<MSearchUsernamesByTerm>(),
  MockSpec<MGetRealtimeStatus>(),
  MockSpec<MGetTop10Players>(),
  MockSpec<MGetChessVariantLeaderboard>(),
  MockSpec<MGetPublicData>(),
  MockSpec<MGetRatingHistory>(),
  MockSpec<MGetManyByIds>(),
  MockSpec<MGetLiveStreamers>(),
  MockSpec<MGetFollowingUsers>(),
  MockSpec<MFollowUser>(),
  MockSpec<MUnfollowUser>(),
  MockSpec<MGetCurrentTvGames>(),
  MockSpec<MGetDailyPuzzle>(),
  MockSpec<MGetPuzzleById>(),
  MockSpec<MGetPuzzleActivity>(),
  MockSpec<MGetPuzzleDashboard>(),
  MockSpec<MExportGame>(),
  MockSpec<MExportGamesOfUser>(),
  MockSpec<MCreateRealTimeSeek>(),
  MockSpec<MCreateCorrespondenceSeek>(),
  MockSpec<MAbortGame>(),
  MockSpec<MClaimVictory>(),
  MockSpec<MFetchGameChat>(),
  MockSpec<MWriteOnGameChat>(),
  MockSpec<MResignGame>(),
  MockSpec<MMakeMove>(),
  MockSpec<MStreamBoardGameState>(),
  MockSpec<MStreamIncomingEvents>(),
])
void main() {}
