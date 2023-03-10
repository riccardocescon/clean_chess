import 'dart:developer';

import 'package:cleanchess/chess/core/utilities/navigation.dart';
import 'package:cleanchess/chess/utilities/utils.dart';
import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:cleanchess/core/presentation/widgets/scale_animated_logo.dart';
import 'package:cleanchess/core/presentation/widgets/scale_animated_widget.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/socials/socials.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/teams/teams.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/users/get_public_data.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/users/search_users_by_term.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/event/event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_state.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/login_screen_chessboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const ScaleAnimatedWidet(
            child: Text(
              'Clean Chess',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _listener(child: _body(context)),
      ),
    );
  }

  Widget _body(context) => SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ScaleAnimatedLogo(size: 150),
            SizedBox(
              width: 200,
              height: 60,
              child: MaterialButton(
                onPressed: () => BlocProvider.of<ServerBloc>(context).add(
                  const LichessOAuthEvent(),
                ),
                color: Colors.teal.shade300,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _animatedBody(context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ScaleAnimatedLogo(size: 150),
            Column(
              children: [
                LoginScreenChessboard(
                  onOAuthStart: () => BlocProvider.of<ServerBloc>(context).add(
                    const LichessOAuthEvent(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  late User user;
  late Team team;
  late JoinRequest joinRequest;
  bool isJoinRequest = false;
  bool isKickRequest = false;
  bool isLeaderboard = false;

  Widget _listener({required Widget child}) =>
      BlocListener<ServerBloc, ServerState>(
        listener: (context, state) {
          if (state is LichessOAuthSuccess) {
            // Get user profile
            BlocProvider.of<ServerBloc>(context).add(
              const GetFollowingUsersEvent(),
            );
          } else if (state is LichessLoaded<List<User>>) {
            log(state.data.toString());
            BlocProvider.of<ServerBloc>(context).add(
              const UnfollowUserEvent(username: 'alexrintt'),
            );
          } else if (state is LichessLoaded<bool>) {
            log(state.data.toString());
          } else if (state is LichessError) {
            showSnackbarError(context, state.failure);
          }
        },
        child: child,
      );

  /* Already Tests
          } else if (state is LichessUserFetched) {
            user = state.user;
            log(user.toString());
            BlocProvider.of<LichessBloc>(context).add(
              const GetMyEmailEvent(),
            );
          } else if (state is LichessLoaded<String>) {
            log(state.data);
            BlocProvider.of<LichessBloc>(context).add(
              const GetMyKidModeStatusEvent(),
            );
          } else if (state is LichessLoaded<bool>) {
            log('Kid Mode:${state.data}');
            BlocProvider.of<LichessBloc>(context).add(
              const SetMyKidModeStatusEvent(false),
            );
          } else if (state is LichessLoaded<Empty>) {
            if (isKickRequest) {
            } else if (isJoinRequest) {
              log('Join Request Accepted');
              BlocProvider.of<LichessBloc>(context).add(
                KickMemberFromTeamEvent(
                  teamId: team.id!,
                  userId: joinRequest.user!.id!,
                ),
              );
            } else {
              log('Kid Mode Set Successfully');
              BlocProvider.of<LichessBloc>(context).add(
                const GetMyPreferencesEvent(),
              );
            }
          } else if (state is LichessLoaded<UserPreferences>) {
            log(state.data.toString());
            BlocProvider.of<LichessBloc>(context).add(
              GetTeamsByUserIdEvent(userId: user.id!),
            );
          } else if (state is LichessLoaded<List<Team>>) {
            log(state.data.toString());
            team = state.data.last;
            BlocProvider.of<LichessBloc>(context).add(
              GetTeamByIdEvent(teamId: team.id!),
            );
          } else if (state is LichessLoaded<Team>) {
            log(state.data.toString());
            BlocProvider.of<LichessBloc>(context).add(
              GetTeamMembersEvent(teamId: team.id!),
            );
          } else if (state is LichessLoaded<List<User>>) {
            log(state.data.toString());
            BlocProvider.of<LichessBloc>(context).add(
              GetTeamJoinRequestsEvent(teamId: team.id!),
            );
          } else if (state is LichessLoaded<List<JoinRequest>>) {
            log(state.data.toString());
            BlocProvider.of<LichessBloc>(context).add(
              const GetPopularTeamsEvent(),
            );
            isKickRequest = true;
          } else if (state is LichessLoaded<PageOf<Team>>) {
            log(state.data.toString());
            
             } else if (state is LichessLoaded<List<String>>) {
            log(state.data.toString());
            BlocProvider.of<LichessBloc>(context).add(
              GetRealtimeStatusEvent(ids: [user.id!], withGameIds: true),
            );
          } else if (state is LichessLoaded<List<RealTimeUserStatus>>) {
            log(state.data.toString());
            BlocProvider.of<LichessBloc>(context).add(
              const GetPublicDataEvent(
                username: 'riccardocescon',
              ),
            );
          } else if (state is LichessLoaded<User>) {
            log(state.data.toString());
            BlocProvider.of<LichessBloc>(context).add(
              const GetRatingHistoryEvent(username: 'riccardocescon'),
            );
          } else if (state is LichessLoaded<List<RatingHistory>>) {
            log(state.data.toString());
            isLeaderboard = true;
            BlocProvider.of<LichessBloc>(context).add(
              const GetLiveStreamersEvent(),
            );
            */
}
