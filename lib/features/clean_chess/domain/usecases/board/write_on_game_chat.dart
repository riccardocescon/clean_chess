import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/usecases/usecase.dart';
import 'package:cleanchess/core/utilities/empty.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class WriteOnGameChat extends UseCase<Empty, WriteOnGameChatParams> {
  @override
  Future<Either<Failure, Empty>> call(WriteOnGameChatParams params) {
    throw UnimplementedError();
  }
}

class WriteOnGameChatParams {
  final String gameId;
  final LichessChatLineRoom room;
  final String text;

  WriteOnGameChatParams({
    required this.gameId,
    required this.room,
    required this.text,
  });
}
