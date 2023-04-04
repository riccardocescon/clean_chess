import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_gain_access_token.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_oauth.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/oauth/lichess/lichess_revoke_token.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cleanchess/core/presentation/bloc/utilities/oauth_helper.dart'
    as oauth_helper;
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';

@freezed
class AuthState with _$AuthState, EquatableMixin {
  factory AuthState.initial() = _InitialAuthStats;

  factory AuthState.logged() = _LoggedAuthStats;

  factory AuthState.notLogged() = _NotLoggedAuthStats;

  factory AuthState.loading() = _LoadingAuthStats;

  factory AuthState.loggedOut() = _LoggedOutAuthStats;

  factory AuthState.error(Failure error) = _ErrorAuthStats;

  const AuthState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      error: (error) => [error],
      orElse: () => [],
    );
  }
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.tokenProvider,
    required this.gainAccessToken,
    required this.oauth,
    required this.revokeToken,
  }) : super(AuthState.initial());

  final LichessTokenProvider tokenProvider;
  final LichessGainAccessToken gainAccessToken;
  final LichessOAuth oauth;
  final LichessRevokeToken revokeToken;

  Future<void> loadInitialState() async {
    final result = await tokenProvider.getClient();

    if (result.isRight()) {
      emit(_LoggedAuthStats());
    } else {
      emit(_NotLoggedAuthStats());
    }
  }

  Future<void> login() async {
    await _startAuthFlow();
  }

  Future<void> revoke() async {
    emit(_LoadingAuthStats());
    final result = await revokeToken.call(tokenProvider.accessToken);

    if (result.isLeft()) {
      emit(_ErrorAuthStats(result.left));
      return;
    }

    await tokenProvider.revokeToken();
    emit(_LoggedOutAuthStats());
  }

  Future<void> _startAuthFlow() async {
    // emit(const AuthState(status: AuthStatus.loading));
    emit(_LoadingAuthStats());

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
        return emit(_NotLoggedAuthStats());
      }

      // Extract the authorization parameters from the response
      final OAuthParams params = data.right;

      // Exchange the authorization code for an access token
      final accessToken = await gainAccessToken.call(
        LichessGainAccessTokenParams(grant: grant, parameters: params),
      );

      if (accessToken.isLeft()) {
        return emit(_NotLoggedAuthStats());
      }

      // Save the access token
      await tokenProvider.saveAccessToken(accessToken.right);

      // return emit(const AuthState(status: AuthStatus.logged));
      return emit(_LoggedAuthStats());
    } catch (e) {
      return emit(_ErrorAuthStats(UnexpectedFailure(e.toString())));
    }
  }
}
