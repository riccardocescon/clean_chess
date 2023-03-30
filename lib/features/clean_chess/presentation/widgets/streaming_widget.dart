import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/tv_game_stream_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/chessboard.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/padded_items.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class StreamingWidget extends StatefulWidget {
  const StreamingWidget({super.key});

  @override
  State<StreamingWidget> createState() => _StreamingWidgetState();
}

class _StreamingWidgetState extends State<StreamingWidget> {
  TvGameStreamCubit get _tvGameStreamBloc => sl<TvGameStreamCubit>();

  @override
  Widget build(BuildContext context) => Column(
        children: [
          PaddedItems(children: [
            BlocBuilder<TvGameStreamCubit, AsyncSnapshot<LichessTvGameSummary>>(
              bloc: _tvGameStreamBloc,
              builder: (context, state) {
                return _streamingUserItem(
                  isWhite: false,
                  title: 'IM',
                  color: Colors.amber,
                  name: state.data?.data?.blackPlayer?.user?.name ??
                      state.data?.data?.blackPlayer?.user?.id ??
                      'Loading info...',
                  elo: state.data?.data?.blackPlayer?.rating?.toString() ??
                      'Loading...',
                  time: '0:20',
                );
              },
            ),
          ]),
          heigth5,
          AspectRatio(
            aspectRatio: 1,
            child: BlocBuilder<TvGameStreamCubit,
                AsyncSnapshot<LichessTvGameSummary>>(
              bloc: _tvGameStreamBloc,
              builder: (context, state) {
                return Chessboard(fen: state.data?.data?.fen);
              },
            ),
            // child: Stack(
            //   children: [
            //     const Chessboard(),
            //     Visibility(
            //       visible: completed,
            //       child: Container(
            //         color: Colors.grey.withAlpha(50),
            //       ),
            //     ),
            //   ],
            // ),
          ),
          heigth5,
          PaddedItems(
            children: [
              BlocBuilder<TvGameStreamCubit,
                  AsyncSnapshot<LichessTvGameSummary>>(
                bloc: _tvGameStreamBloc,
                builder: (context, state) {
                  return _streamingUserItem(
                    isWhite: true,
                    title: 'GM',
                    color: Colors.pink,
                    name: state.data?.data?.whitePlayer?.user?.name ??
                        state.data?.data?.whitePlayer?.user?.id ??
                        'Loading info...',
                    elo: state.data?.data?.whitePlayer?.rating?.toString() ??
                        'Loading...',
                    time: '0:20',
                  );
                },
              ),
            ],
          ),
        ],
      );

  Widget _streamingUserItem({
    required bool isWhite,
    required String title,
    required Color color,
    required String name,
    required String elo,
    String? time,
  }) =>
      Row(
        children: [
          _teamColorItem(isWhite),
          const SizedBox(width: 10),
          _titleItem(title, color),
          const SizedBox(width: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            elo,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withAlpha(50),
              fontWeight: FontWeight.bold,
            ),
          ),
          //TODO: add flag icon
          const Spacer(),
          if (time != null)
            Text(
              time,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            )
        ],
      );

  Widget _titleItem(String title, Color color) => Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: color,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _teamColorItem(bool isWhite) => CircleAvatar(
        backgroundColor: Colors.white,
        radius: 14,
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Image.asset(
            isWhite
                ? 'assets/pieces/flat/white_pawn.png'
                : 'assets/pieces/flat/black_pawn.png',
          ),
        ),
      );
}
