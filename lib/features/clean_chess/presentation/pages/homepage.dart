import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:clean_chess/core/utilities/enums.dart';
import 'package:clean_chess/core/utilities/extensions.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/data/models/piece.dart';
import 'package:clean_chess/features/clean_chess/data/models/puzzle.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_bloc.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_event.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_state.dart';
import 'package:clean_chess/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({
    super.key,
    required this.board,
  });

  final Board board;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Puzzle _getRandomPuzzle() => Puzzle.fromString(
      csvItem: puzzleDb[Random().nextInt(puzzleDb.length)].join(','));

  void _autoFirstMove(Puzzle puzzle) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      final nextMove = puzzle.nextMove(widget.board.toFen());
      BlocProvider.of<BoardBloc>(context).add(
        PieceMoveEvent(board: widget.board, movement: nextMove!),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final puzzle = _getRandomPuzzle();
    _autoFirstMove(puzzle);
    widget.board.setFen(puzzle.fen);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clean Chess',
          style: TextStyle(
            fontSize: 26,
          ),
        ),
        centerTitle: true,
      ),
      body: _body(context, puzzle),
    );
  }

  Widget _body(context, Puzzle puzzle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            puzzle.title.capitalize(),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            puzzle.id,
            style: const TextStyle(
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          AspectRatio(
            aspectRatio: 1,
            child: _board(context),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        final previousMoveFen = puzzle.previousMoveFen;
                        BlocProvider.of<BoardBloc>(context).add(
                          SetFenEvent(
                              board: widget.board, fen: previousMoveFen),
                        );
                      },
                      color: Colors.grey.shade300,
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        size: 26,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {});
                      },
                      color: Colors.grey.shade300,
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.refresh_rounded,
                        size: 26,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        final nextMove = puzzle.nextMove(widget.board.toFen());
                        if (nextMove == null) return;
                        BlocProvider.of<BoardBloc>(context).add(
                          PieceMoveEvent(
                            board: widget.board,
                            movement: nextMove,
                          ),
                        );
                      },
                      color: Colors.grey.shade300,
                      padding: EdgeInsets.zero,
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 26,
                        color: Colors.grey.shade900,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _board(context) {
    return BlocConsumer<BoardBloc, BoardState>(
      listener: (context, state) => print(state),
      builder: (_, state) {
        return GridView.count(
          crossAxisCount: 8,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(64, (index) {
            final square = widget.board.squares[index ~/ 8][index % 8];
            return Container(
              decoration: BoxDecoration(
                color: getColor(index, state, square.coord),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
              ),
              child: Stack(
                children: [
                  _cellName(square.coord),
                  if (square.piece != null) _piece(square, context),
                  // _cellPowerWidget(square),
                ],
              ),
            );
          }),
        );
      },
    );
  }

  Widget _cellPowerWidget(Square square) => Column(
        children: [
          Text("w:${square.whiteControl}"),
          Text("b:${square.blackControl}"),
        ],
      );

  Widget _cellName(String coord) => Positioned(
        bottom: 2,
        left: 2,
        child: Text(
          coord,
          style: TextStyle(
            color: Colors.grey.shade200,
            fontSize: 12,
          ),
        ),
      );

  Widget _piece(Square square, context) => SizedBox(
        width: 90,
        height: 90,
        child: MaterialButton(
          onPressed: () {
            BlocProvider.of<BoardBloc>(context)
                .add(PieceSelectedEvent(square.coord));
          },
          padding: EdgeInsets.zero,
          child: Image.asset(
            square.piece!.imagePath,
          ),
        ),
      );

  Color getColor(int index, BoardState state, String squareCoord) {
    if (state is BoardPlaning) {
      if (state.interactableSquares.map((e) => e.coord).contains(squareCoord)) {
        return Colors.red.shade700;
      }
    }
    int cellColor = (index % 2);
    int row = (index ~/ 8) % 2;
    if (row == 0) {
      cellColor = (index % 2) == 0 ? 1 : 0;
    }
    return cellColor == 0 ? Colors.grey.shade700 : Colors.grey.shade800;
  }
}
