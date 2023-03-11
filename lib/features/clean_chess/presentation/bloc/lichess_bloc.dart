import 'package:cleanchess/chess/error/failures.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/net_login_data.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/lichess_oauth.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

class LichessBloc extends Bloc<LichessOAuthEvent, LichessState> {
  final LichessOAuth oauth;

  LichessBloc({required this.oauth}) : super(LichessInitial()) {
    on<LichessOAuthEvent>((event, emit) async {
      emit(LichessLoading());

      const String charset =
          'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';

      final codeVerifier = List.generate(
              128, (i) => charset[math.Random.secure().nextInt(charset.length)])
          .join();

      final stateVerifier = List.generate(
              128, (i) => charset[math.Random.secure().nextInt(charset.length)])
          .join();

      const clientId = 'cleanchess';
      const redirectUri = 'com.example.cleanchess://authorize';

      try {
        final data = await oauth.call(
          LichessOAuthParams(
            codeVerifier: codeVerifier,
            stateVerifier: stateVerifier,
            clientId: clientId,
            redirectUri: redirectUri,
          ),
        );

        data.fold(
          (error) => emit(LichessError(error)),
          (account) => emit(const LichessOAuthSuccess()),
        );
      } catch (e) {
        emit(LichessError(UnexpectedFailure(e.toString())));
      }
    });
  }
}
