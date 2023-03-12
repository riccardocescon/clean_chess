import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/chess/utilities/extensions.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:cleanchess/core/presentation/bloc/utilities/oauth_helper.dart'
    as oauth_helper;
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/account/account.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_gain_access_token.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/teams/decline_join_request.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/teams/teams.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessBloc extends Bloc<LichessEvent, LichessState> {
  final LichessTokenProvider tokenProvider;

  final LichessOAuth oauth;
  final LichessGainAccessToken gainAccessToken;
  final GetMyProfile getMyProfile;
  final GetMyEmail getMyEmail;
  final GetMyKidModeStatus getMyKidModeStatus;
  final SetMyKidModeStatus setMyKidModeStatus;
  final GetMyPreferences getMyPreferences;
  final GetTeamsByUser getTeamsByUser;
  final GetTeamById getTeamById;
  final GetTeamMembers getTeamMembers;
  final GetTeamJoinRequests getTeamJoinRequests;
  final AcceptJoinRequest acceptJoinRequest;
  final KickMemberFromTeam kickMemberFromTeam;
  final DeclineJoinRequest declineJoinRequest;
  final JoinTeam joinTeam;

  LichessBloc({
    required this.tokenProvider,
    required this.oauth,
    required this.gainAccessToken,
    required this.getMyProfile,
    required this.getMyEmail,
    required this.getMyKidModeStatus,
    required this.setMyKidModeStatus,
    required this.getMyPreferences,
    required this.getTeamsByUser,
    required this.getTeamById,
    required this.getTeamMembers,
    required this.getTeamJoinRequests,
    required this.acceptJoinRequest,
    required this.declineJoinRequest,
    required this.kickMemberFromTeam,
    required this.joinTeam,
  }) : super(LichessInitial()) {
    on<LichessOAuthEvent>(_oauthProcedure);
    on<GetMyProfileEvent>((event, emit) async {
      emit(LichessLoading());
      final user = await getMyProfile.call(NoParams());

      user.fold(
        (failure) => emit(LichessError(failure)),
        (user) => emit(LichessUserFetched(user)),
      );
    });
    on<GetMyEmailEvent>((event, emit) async {
      emit(LichessLoading());
      final email = await getMyEmail.call(NoParams());

      email.fold(
        (failure) => emit(LichessError(failure)),
        (email) => emit(LichessLoaded<String>(email)),
      );
    });
    on<GetMyKidModeStatusEvent>((event, emit) async {
      emit(LichessLoading());
      final kidModeStatus = await getMyKidModeStatus.call(NoParams());

      kidModeStatus.fold(
        (failure) => emit(LichessError(failure)),
        (kidModeStatus) => emit(LichessLoaded<bool>(kidModeStatus)),
      );
    });
    on<SetMyKidModeStatusEvent>((event, emit) async {
      emit(LichessLoading());
      final kidModeStatus = await setMyKidModeStatus.call(event.kidModeStatus);

      kidModeStatus.fold(
        (failure) => emit(LichessError(failure)),
        (kidModeStatus) => emit(const LichessLoaded<Empty>(Empty())),
      );
    });
    on<GetMyPreferencesEvent>((event, emit) async {
      emit(LichessLoading());
      final preferences = await getMyPreferences.call(NoParams());

      preferences.fold(
        (failure) => emit(LichessError(failure)),
        (preferences) => emit(LichessLoaded<UserPreferences>(preferences)),
      );
    });
    on<GetTeamsByUserIdEvent>((event, emit) async {
      emit(LichessLoading());
      final teams = await getTeamsByUser.call(event.userId);

      teams.fold(
        (failure) => emit(LichessError(failure)),
        (teams) => emit(LichessLoaded<List<Team>>(teams)),
      );
    });
    on<GetTeamByIdEvent>((event, emit) async {
      emit(LichessLoading());
      final team = await getTeamById.call(event.teamId);

      team.fold(
        (failure) => emit(LichessError(failure)),
        (team) => emit(LichessLoaded<Team>(team)),
      );
    });
    on<GetTeamMembersEvent>((event, emit) async {
      emit(LichessLoading());
      final members = await getTeamMembers.call(event.teamId);

      members.fold(
        (failure) => emit(LichessError(failure)),
        (members) => emit(LichessLoaded<List<User>>(members)),
      );
    });
    on<GetTeamJoinRequestsEvent>((event, emit) async {
      emit(LichessLoading());
      final joinRequests = await getTeamJoinRequests.call(event.teamId);

      joinRequests.fold(
        (failure) => emit(LichessError(failure)),
        (joinRequests) => emit(LichessLoaded<List<JoinRequest>>(joinRequests)),
      );
    });
    on<AcceptJoinRequestEvent>((event, emit) async {
      emit(LichessLoading());
      final joinRequest = await acceptJoinRequest.call(
        AcceptJoinRequestParams(
          event.teamId,
          event.userId,
        ),
      );

      joinRequest.fold(
        (failure) => emit(LichessError(failure)),
        (joinRequest) => emit(const LichessLoaded<Empty>(Empty())),
      );
    });
    on<DeclineJoinRequestEvent>((event, emit) async {
      emit(LichessLoading());
      final joinRequest = await declineJoinRequest.call(
        DeclineJoinRequestParams(
          event.teamId,
          event.userId,
        ),
      );

      joinRequest.fold(
        (failure) => emit(LichessError(failure)),
        (joinRequest) => emit(const LichessLoaded<Empty>(Empty())),
      );
    });
    on<KickMemberFromTeamEvent>((event, emit) async {
      emit(LichessLoading());
      final kickMember = await kickMemberFromTeam.call(
        KickMemberFromTeamParams(
          event.teamId,
          event.userId,
        ),
      );

      kickMember.fold(
        (failure) => emit(LichessError(failure)),
        (kickMember) => emit(const LichessLoaded<Empty>(Empty())),
      );
    });
    on<JoinTeamEvent>((event, emit) async {
      emit(LichessLoading());
      final join = await joinTeam.call(
        JoinTeamParams(
          event.teamId,
          message: event.message,
          passwrord: event.password,
        ),
      );

      join.fold(
        (failure) => emit(LichessError(failure)),
        (join) => emit(const LichessLoaded<Empty>(Empty())),
      );
    });
  }

  void _oauthProcedure(
    LichessOAuthEvent event,
    Emitter<LichessState> emit,
  ) async {
    emit(LichessLoading());

    // Generate an authorization URL that asks for the oauth2 permission
    const clientId = 'cleanchess';
    final grant = oauth_helper.getAuthorizationCodeGrant(
      clientId: clientId,
      oauthUri: 'https://lichess.org/oauth',
      tokenUri: 'https://lichess.org/api/token',
    );

    // Generate a random StateVerifier for the authorization request
    final stateVerifier = oauth_helper.getRandomVerifier;

    // Create a callback URL that will be used by the authorization server
    // to redirect the user back to the app with the authorization code
    const redirectUri = 'com.example.cleanchess://authorize';

    try {
      // Perform the authorization request
      final data = await oauth.call(
        LichessOAuthParams(
          grant: grant,
          stateVerifier: stateVerifier,
          redirectUri: redirectUri,
        ),
      );

      if (data.isLeft()) {
        emit(LichessError(data.left));
        return;
      }

      // Extract the authorization parameters from the response
      final OAuthParams params = data.right;

      // Exchange the authorization code for an access token
      final accessToken = await gainAccessToken.call(
        LichessGainAccessTokenParams(grant: grant, parameters: params),
      );

      if (accessToken.isLeft()) {
        emit(LichessError(accessToken.left));
        return;
      }

      // Save the access token
      await tokenProvider.saveAccessToken(accessToken.right);

      emit(const LichessOAuthSuccess());
    } catch (e) {
      emit(LichessError(UnexpectedFailure(e.toString())));
    }
  }
}
