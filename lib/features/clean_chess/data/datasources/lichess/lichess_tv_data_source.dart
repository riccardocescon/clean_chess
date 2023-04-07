import 'package:cleanchess/core/errors/failure.dart';
import 'package:cleanchess/core/utilities/debug.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/data/datasources/remove_tv_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class LichessTvDataSource extends RemoteTvDataSource {
  final LichessTokenProvider _tokenProvider;

  LichessTvDataSource(this._tokenProvider);

  @override
  Future<Either<Failure, List<LichessTvGameBasicInfo>>>
      getCurrentTvGames() async {
    try {
      logDebug(
        'Getting current Stream Tv Game',
        tag: 'Account',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      //intellisense is so slow on liveshare, can you copy the item?
      final response = await client.tv.getCurrentTvGames();
      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Stream<LichessTvGameSummary>>>
      streamCurrentTvGame() async {
    try {
      logDebug(
        'Getting current Stream Tv Game',
        tag: 'Account',
        color: LogColor.lightBlue,
      );
      final maybeClient = await _tokenProvider.getClient();
      if (maybeClient.isLeft()) return Left(maybeClient.left);

      final client = maybeClient.right;
      //intellisense is so slow on liveshare, can you copy the item?
      final response = client.tv.streamCurrentTvGame();
      return Right(response);
    } catch (e) {
      return Left(LichessOAuthFailure('Lichess OAuth Failed: ${e.toString()}'));
    }
  }
}
