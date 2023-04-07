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
abstract class AuthState with _$AuthState, EquatableMixin {
  const factory AuthState.initial() = _InitialAuthStats;

  const factory AuthState.logged() = _LoggedAuthStats;

  const factory AuthState.notLogged() = _NotLoggedAuthStats;

  const factory AuthState.loading() = _LoadingAuthStats;

  const factory AuthState.loggedOut() = _LoggedOutAuthStats;

  const factory AuthState.failure(Failure error) = _ErrorAuthStats;

  const AuthState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      failure: (error) => [error],
      orElse: () => [],
    );
  }
}

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required LichessTokenProvider tokenProvider,
    required LichessGainAccessToken gainAccessToken,
    required LichessOAuth oauth,
    required LichessRevokeToken revokeToken,
  }) : super(const _InitialAuthStats()) {
    _tokenProvider = tokenProvider;
    _gainAccessToken = gainAccessToken;
    _oauth = oauth;
    _revokeToken = revokeToken;
  }

  late final LichessTokenProvider _tokenProvider;
  late final LichessGainAccessToken _gainAccessToken;
  late final LichessOAuth _oauth;
  late final LichessRevokeToken _revokeToken;

  Future<void> loadInitialState() async {
    final result = await _tokenProvider.getClient();

    if (result.isRight()) {
      emit(const _LoggedAuthStats());
    } else {
      emit(const _NotLoggedAuthStats());
    }
  }

  Future<void> login() async {
    await _startAuthFlow();
  }

  Future<void> revoke() async {
    emit(const _LoadingAuthStats());
    final result = await _revokeToken.call(_tokenProvider.accessToken);

    if (result.isLeft()) {
      emit(_ErrorAuthStats(result.left));
      return;
    }

    await _tokenProvider.revokeToken();
    emit(const _LoggedOutAuthStats());
  }

  Future<void> _startAuthFlow() async {
    // emit(const AuthState(status: AuthStatus.loading));
    emit(const _LoadingAuthStats());

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
      final data = await _oauth.call(
        LichessOAuthParams(
          grant: grant,
          stateVerifier: stateVerifier,
          redirectUri: redirectUri,
        ),
      );

      if (data.isLeft()) {
        return emit(_ErrorAuthStats(data.left));
      }

      // Extract the authorization parameters from the response
      final OAuthParams params = data.right;

      // Exchange the authorization code for an access token
      final accessToken = await _gainAccessToken.call(
        LichessGainAccessTokenParams(grant: grant, parameters: params),
      );

      if (accessToken.isLeft()) {
        return emit(_ErrorAuthStats(accessToken.left));
      }

      // Save the access token
      await _tokenProvider.saveAccessToken(accessToken.right);

      // return emit(const AuthState(status: AuthStatus.logged));
      return emit(const _LoggedAuthStats());
    } catch (e) {
      return emit(_ErrorAuthStats(UnexpectedFailure(e.toString())));
    }
  }
}
