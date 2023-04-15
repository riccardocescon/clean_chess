import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/core/utilities/globals.dart';
import 'package:cleanchess/features/clean_chess/domain/usecases/board/board.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

part 'board_cubit.freezed.dart';

@freezed
abstract class BoardState with _$BoardState, EquatableMixin {
  const factory BoardState.initial() = _InitialBoardState;

  const factory BoardState.loading() = _LoadingBoardState;

  const factory BoardState.realTimeSeek(Keepalive keepalive) =
      _RealTimeSeekBoardState;

  const factory BoardState.correspondenceSeek(Keepalive keepalive) =
      _CorrespondenceSeekBoardState;

  const factory BoardState.gameAborted() = _GameAbortedBoardState;

  const factory BoardState.victoryClaimed() = _VictoryClaimedBoardState;

  const factory BoardState.gameChatMessage(LichessGameChatMessage message) =
      _GameChatMessageBoardState;

  const factory BoardState.gameChatCompleted() =
      _ChatMessageCompletedBoardState;

  const factory BoardState.wroteOnGameChat() = _WroteOnGameChatBoardState;

  const factory BoardState.gameResigned() = _GameResignedBoardState;

  const factory BoardState.moveMade() = _MoveMadeBoardState;

  const factory BoardState.streamGameState(LichessBoardGameEvent event) =
      _StreamGameStateBoardState;

  const factory BoardState.streamGameCompleted() =
      _StreamGameCompletedBoardState;

  const factory BoardState.incomingEvent(LichessBoardGameIncomingEvent event) =
      _IncomingEventBoardState;

  const factory BoardState.incomingEventCompleted() =
      _IncomingEventCompletedBoardState;

  const factory BoardState.failure(Failure error) = _ErrorBoardState;

  const BoardState._();

  @override
  List<Object?> get props {
    return maybeWhen(
      gameChatMessage: (message) => [message.text, message.user],
      streamGameState: (event) => [event.type],
      incomingEvent: (event) => [event.type],
      failure: (error) => [error],
      orElse: () => [],
    );
  }
}

class BoardCubit extends Cubit<BoardState> {
  final CreateRealTimeSeek _createRealTimeSeek;
  final CreateCorrespondenceSeek _createCorrespondenceSeek;
  final AbortGame _abortGame;
  final ClaimVictory _claimVictory;
  final FetchGameChat _fetchGameChat;
  final WriteOnGameChat _writeOnGameChat;
  final ResignGame _resignGame;
  final MakeMove _makeMove;
  final StreamBoardGameState _streamBoardGameState;
  final StreamIncomingEvents _streamIncomingEvents;

  BoardCubit({
    required CreateRealTimeSeek createRealTimeSeek,
    required CreateCorrespondenceSeek createCorrespondenceSeek,
    required AbortGame abortGame,
    required ClaimVictory claimVictory,
    required FetchGameChat fetchGameChat,
    required WriteOnGameChat writeOnGameChat,
    required ResignGame resignGame,
    required MakeMove makeMove,
    required StreamBoardGameState streamBoardGameState,
    required StreamIncomingEvents streamIncomingEvents,
  })  : _createRealTimeSeek = createRealTimeSeek,
        _createCorrespondenceSeek = createCorrespondenceSeek,
        _abortGame = abortGame,
        _claimVictory = claimVictory,
        _fetchGameChat = fetchGameChat,
        _writeOnGameChat = writeOnGameChat,
        _resignGame = resignGame,
        _makeMove = makeMove,
        _streamBoardGameState = streamBoardGameState,
        _streamIncomingEvents = streamIncomingEvents,
        super(const _InitialBoardState());

  Future<void> createRealTimeSeek({
    required double time,
    required int increment,
    DaysPerTurn? days,
    bool rated = false,
    LichessVariantKey variant = LichessVariantKey.standard,
    LichessChallengeColor color = LichessChallengeColor.random,
    int? maxRating,
    int? minRating,
  }) async {
    emit(const _LoadingBoardState());
    final result = await _createRealTimeSeek(
      CreateRealTimeSeekParams(
        time: time,
        increment: increment,
        days: days,
        rated: rated,
        variant: variant,
        color: color,
        maxRating: maxRating,
        minRating: minRating,
      ),
    );
    result.fold(
      (failure) => emit(BoardState.failure(failure)),
      (keepalive) => emit(BoardState.realTimeSeek(keepalive)),
    );
  }

  Future<void> createCorrespondenceSeek({
    required DaysPerTurn days,
    bool rated = false,
    LichessVariantKey variant = LichessVariantKey.standard,
    LichessChallengeColor color = LichessChallengeColor.random,
    double? time,
    int? increment,
    int? maxRating,
    int? minRating,
  }) async {
    emit(const _LoadingBoardState());
    final result = await _createCorrespondenceSeek(
      CreateCorrespondenceSeekParams(
        days: days,
        rated: rated,
        variant: variant,
        color: color,
        time: time,
        increment: increment,
        maxRating: maxRating,
        minRating: minRating,
      ),
    );
    result.fold(
      (failure) => emit(BoardState.failure(failure)),
      (keepalive) => emit(BoardState.correspondenceSeek(keepalive)),
    );
  }

  Future<void> abortGame({required String gameId}) async {
    emit(const _LoadingBoardState());
    final result = await _abortGame(gameId);
    result.fold(
      (failure) => emit(BoardState.failure(failure)),
      (keepalive) => emit(const BoardState.gameAborted()),
    );
  }

  Future<void> claimVictory({required String gameId}) async {
    emit(const _LoadingBoardState());
    final result = await _claimVictory(gameId);
    result.fold(
      (failure) => emit(BoardState.failure(failure)),
      (keepalive) => emit(const BoardState.victoryClaimed()),
    );
  }

  Future<void> fetchGameChat({required String gameId}) async {
    emit(const _LoadingBoardState());
    final result = await _fetchGameChat(gameId);
    if (result.isLeft()) {
      emit(BoardState.failure(result.left));
      return;
    }

    await for (final message in result.right) {
      emit(BoardState.gameChatMessage(message));
    }
    emit(const BoardState.gameChatCompleted());
  }

  Future<void> writeOnGameChat({
    required String gameId,
    required LichessChatLineRoom room,
    required String text,
  }) async {
    emit(const _LoadingBoardState());
    final result = await _writeOnGameChat(
      WriteOnGameChatParams(
        gameId: gameId,
        room: room,
        text: text,
      ),
    );
    result.fold(
      (failure) => emit(BoardState.failure(failure)),
      (keepalive) => emit(const BoardState.wroteOnGameChat()),
    );
  }

  Future<void> resignGame({required String gameId}) async {
    emit(const _LoadingBoardState());
    final result = await _resignGame(gameId);
    result.fold(
      (failure) => emit(BoardState.failure(failure)),
      (keepalive) => emit(const BoardState.gameResigned()),
    );
  }

  Future<void> makeMove({
    required String gameId,
    required String move,
    required bool? offeringDraw,
  }) async {
    emit(const _LoadingBoardState());
    final result = await _makeMove(
      MakeMoveParams(
        gameId: gameId,
        move: move,
        offeringDraw: offeringDraw,
      ),
    );
    result.fold(
      (failure) => emit(BoardState.failure(failure)),
      (keepalive) => emit(const BoardState.moveMade()),
    );
  }

  Future<void> streamGameState({required String gameId}) async {
    emit(const _LoadingBoardState());
    final result = await _streamBoardGameState(gameId);
    if (result.isLeft()) {
      emit(BoardState.failure(result.left));
      return;
    }

    await for (final event in result.right) {
      emit(BoardState.streamGameState(event));
    }
    emit(const BoardState.streamGameCompleted());
  }

  Future<void> streamIncomingEvents() async {
    emit(const _LoadingBoardState());
    final result = await _streamIncomingEvents();
    if (result.isLeft()) {
      emit(BoardState.failure(result.left));
      return;
    }

    await for (final event in result.right) {
      emit(BoardState.incomingEvent(event));
    }
    emit(const BoardState.incomingEventCompleted());
  }
}
