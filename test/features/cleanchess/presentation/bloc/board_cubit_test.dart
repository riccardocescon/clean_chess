import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:cleanchess/core/utilities/globals.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/board_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:mockito/mockito.dart';
import 'lichess_bloc_mocks.mocks.dart';

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockMCreateRealTimeSeek mockCreateRealTimeSeek;
  late MockMCreateCorrespondenceSeek mockCreateCorrespondenceSeek;
  late MockMAbortGame mockAbortGame;
  late MockMClaimVictory mockClaimVictory;
  late MockMFetchGameChat mockFetchGameChat;
  late MockMWriteOnGameChat mockWriteOnGameChat;

  late BoardCubit bloc;

  late Keepalive keepalive;

  setUp(() {
    mockCreateRealTimeSeek = MockMCreateRealTimeSeek();
    mockCreateCorrespondenceSeek = MockMCreateCorrespondenceSeek();
    mockAbortGame = MockMAbortGame();
    mockClaimVictory = MockMClaimVictory();
    mockFetchGameChat = MockMFetchGameChat();
    mockWriteOnGameChat = MockMWriteOnGameChat();
    keepalive = () async {};

    bloc = BoardCubit(
      createRealTimeSeek: mockCreateRealTimeSeek,
      createCorrespondenceSeek: mockCreateCorrespondenceSeek,
      abortGame: mockAbortGame,
      claimVictory: mockClaimVictory,
      fetchGameChat: mockFetchGameChat,
      writeOnGameChat: mockWriteOnGameChat,
    );
  });

  group('Board', () {
    group('Create RealTime Seek', () {
      blocTest<BoardCubit, BoardState>(
        'Success',
        build: () {
          when(mockCreateRealTimeSeek.call(any)).thenAnswer(
            (_) async => Right(keepalive),
          );

          return bloc;
        },
        act: (bloc) => bloc.createRealTimeSeek(time: 0, increment: 0),
        expect: () => [
          const BoardState.loading(),
          BoardState.realTimeSeek(keepalive),
        ],
        verify: (bloc) {
          verify(mockCreateRealTimeSeek.call(any)).called(1);
        },
      );

      blocTest<BoardCubit, BoardState>(
        'Failure',
        build: () {
          when(mockCreateRealTimeSeek.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAtuh error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.createRealTimeSeek(time: 0, increment: 0),
        expect: () => [
          const BoardState.loading(),
          const BoardState.failure(LichessOAuthFailure('OAtuh error')),
        ],
        verify: (bloc) {
          verify(mockCreateRealTimeSeek.call(any)).called(1);
        },
      );
    });

    group('Create Correspondence Seek', () {
      blocTest<BoardCubit, BoardState>(
        'Success',
        build: () {
          when(mockCreateCorrespondenceSeek.call(any)).thenAnswer(
            (_) async => Right(keepalive),
          );

          return bloc;
        },
        act: (bloc) => bloc.createCorrespondenceSeek(days: DaysPerTurn.one),
        expect: () => [
          const BoardState.loading(),
          BoardState.correspondenceSeek(keepalive),
        ],
        verify: (bloc) {
          verify(mockCreateCorrespondenceSeek.call(any)).called(1);
        },
      );

      blocTest<BoardCubit, BoardState>(
        'Failure',
        build: () {
          when(mockCreateCorrespondenceSeek.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAtuh error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.createCorrespondenceSeek(days: DaysPerTurn.one),
        expect: () => [
          const BoardState.loading(),
          const BoardState.failure(LichessOAuthFailure('OAtuh error')),
        ],
        verify: (bloc) {
          verify(mockCreateCorrespondenceSeek.call(any)).called(1);
        },
      );
    });

    group('Abort Game', () {
      blocTest<BoardCubit, BoardState>(
        'Success',
        build: () {
          when(mockAbortGame.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.abortGame(gameId: ''),
        expect: () => [
          const BoardState.loading(),
          const BoardState.gameAborted(),
        ],
        verify: (bloc) {
          verify(mockAbortGame.call(any)).called(1);
        },
      );

      blocTest<BoardCubit, BoardState>(
        'Failure',
        build: () {
          when(mockAbortGame.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAtuh error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.abortGame(gameId: ''),
        expect: () => [
          const BoardState.loading(),
          const BoardState.failure(LichessOAuthFailure('OAtuh error')),
        ],
        verify: (bloc) {
          verify(mockAbortGame.call(any)).called(1);
        },
      );
    });

    group('Claim Victory', () {
      blocTest<BoardCubit, BoardState>(
        'Success',
        build: () {
          when(mockClaimVictory.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.claimVictory(gameId: ''),
        expect: () => [
          const BoardState.loading(),
          const BoardState.victoryClaimed(),
        ],
        verify: (bloc) {
          verify(mockClaimVictory.call(any)).called(1);
        },
      );

      blocTest<BoardCubit, BoardState>(
        'Failure',
        build: () {
          when(mockClaimVictory.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAtuh error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.claimVictory(gameId: ''),
        expect: () => [
          const BoardState.loading(),
          const BoardState.failure(LichessOAuthFailure('OAtuh error')),
        ],
        verify: (bloc) {
          verify(mockClaimVictory.call(any)).called(1);
        },
      );
    });

    group('Fetch Game Chat', () {
      blocTest<BoardCubit, BoardState>(
        'Success',
        build: () {
          when(mockFetchGameChat.call(any)).thenAnswer(
            (_) async => Right(Stream<LichessGameChatMessage>.fromIterable([
              const LichessGameChatMessage(text: 'a', user: ''),
              const LichessGameChatMessage(text: 'b', user: ''),
              const LichessGameChatMessage(text: 'c', user: ''),
            ])),
          );

          return bloc;
        },
        act: (bloc) => bloc.fetchGameChat(gameId: ''),
        expect: () => [
          const BoardState.loading(),
          const BoardState.gameChatMessage(
            LichessGameChatMessage(text: 'a', user: ''),
          ),
          const BoardState.gameChatMessage(
            LichessGameChatMessage(text: 'b', user: ''),
          ),
          const BoardState.gameChatMessage(
            LichessGameChatMessage(text: 'c', user: ''),
          ),
          const BoardState.gameChatCompleted(),
        ],
        verify: (bloc) {
          verify(mockFetchGameChat.call(any)).called(1);
        },
      );

      blocTest<BoardCubit, BoardState>(
        'Failure',
        build: () {
          when(mockFetchGameChat.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAtuh error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.fetchGameChat(gameId: ''),
        expect: () => [
          const BoardState.loading(),
          const BoardState.failure(LichessOAuthFailure('OAtuh error')),
        ],
        verify: (bloc) {
          verify(mockFetchGameChat.call(any)).called(1);
        },
      );
    });

    group('Send Game Chat Message', () {
      blocTest<BoardCubit, BoardState>(
        'Success',
        build: () {
          when(mockWriteOnGameChat.call(any)).thenAnswer(
            (_) async => const Right(Empty()),
          );

          return bloc;
        },
        act: (bloc) => bloc.writeOnGameChat(
          gameId: '',
          room: LichessChatLineRoom.player,
          text: '',
        ),
        expect: () => [
          const BoardState.loading(),
          const BoardState.wroteOnGameChat(),
        ],
        verify: (bloc) {
          verify(mockWriteOnGameChat.call(any)).called(1);
        },
      );

      blocTest<BoardCubit, BoardState>(
        'Failure',
        build: () {
          when(mockWriteOnGameChat.call(any)).thenAnswer(
            (_) async => const Left(LichessOAuthFailure('OAtuh error')),
          );

          return bloc;
        },
        act: (bloc) => bloc.writeOnGameChat(
          gameId: '',
          room: LichessChatLineRoom.player,
          text: '',
        ),
        expect: () => [
          const BoardState.loading(),
          const BoardState.failure(LichessOAuthFailure('OAtuh error')),
        ],
        verify: (bloc) {
          verify(mockWriteOnGameChat.call(any)).called(1);
        },
      );
    });
  });
}
