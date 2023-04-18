import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/game_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/mockito.dart';

import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMExportGame mockExportGame;
  late MockMExportGamesOfUser mockExportGamesOfUser;

  late GameCubit bloc;

  late LichessGame lichessGameSample;

  setUp(() {
    mockExportGame = MockMExportGame();
    mockExportGamesOfUser = MockMExportGamesOfUser();

    bloc = GameCubit(
      exportGame: mockExportGame,
      exportGamesOfUser: mockExportGamesOfUser,
    );

    lichessGameSample = const LichessGame(
      id: '',
      rated: false,
      variant: LichessVariantKey.standard,
      speed: LichessSpeed.classical,
      perf: PerfType.classical,
      createdAt: 0,
      lastMoveAt: 0,
      status: LichessGameStatus.resign,
      players: LichessGamePlayers(),
    );
  });

  group('Game', () {
    group('Export Game', () {
      blocTest<GameCubit, GameState>(
        'Success',
        build: () {
          when(mockExportGame.call(any)).thenAnswer(
            (_) async => Right(lichessGameSample),
          );

          return bloc;
        },
        act: (bloc) => bloc.exportGame(gameId: ''),
        expect: () => [
          const GameState.loading(),
          GameState.gameExported(lichessGameSample),
        ],
        verify: (bloc) {
          verify(mockExportGame.call(any)).called(1);
        },
      );

      blocTest<GameCubit, GameState>(
        'Failure',
        build: () {
          when(mockExportGame.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.exportGame(gameId: ''),
        expect: () => [
          const GameState.loading(),
          const GameState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockExportGame.call(any)).called(1);
        },
      );
    });

    group('Export Games of User', () {
      blocTest<GameCubit, GameState>(
        'Success',
        build: () {
          when(mockExportGamesOfUser.call(any)).thenAnswer(
            (_) async => Right(
              Stream.fromIterable(
                [
                  lichessGameSample.copyWith(id: '1'),
                  lichessGameSample.copyWith(id: '2'),
                  lichessGameSample.copyWith(id: '3'),
                ],
              ),
            ),
          );

          return bloc;
        },
        act: (bloc) => bloc.exportGamesOfUser(username: ''),
        expect: () => [
          const GameState.loading(),
          GameState.gameExported(lichessGameSample.copyWith(id: '1')),
          GameState.gameExported(lichessGameSample.copyWith(id: '2')),
          GameState.gameExported(lichessGameSample.copyWith(id: '3')),
        ],
        verify: (bloc) {
          verify(mockExportGamesOfUser.call(any)).called(1);
        },
      );

      blocTest<GameCubit, GameState>(
        'Failure',
        build: () {
          when(mockExportGamesOfUser.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAuth failure')),
          );

          return bloc;
        },
        act: (bloc) => bloc.exportGamesOfUser(username: ''),
        expect: () => [
          const GameState.loading(),
          const GameState.failure(LichessOAuthFailure('OAuth failure')),
        ],
        verify: (bloc) {
          verify(mockExportGamesOfUser.call(any)).called(1);
        },
      );
    });
  });
}
