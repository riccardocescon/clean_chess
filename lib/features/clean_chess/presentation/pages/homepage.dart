import 'dart:math';

import 'package:clean_chess/core/utilities/extensions.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/data/models/puzzle.dart';
import 'package:clean_chess/features/clean_chess/data/models/square.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_bloc.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_event.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_state.dart';
import 'package:clean_chess/features/clean_chess/presentation/widgets/failed_icon.dart';
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
  late String _lastPlayedFen;
  int _previousCounter = 0;
  bool _hasFailed = false;

  late Puzzle puzzle;

  Puzzle _getRandomPuzzle() => Puzzle.fromString(
      csvItem: puzzleDb[Random().nextInt(puzzleDb.length)].join(','));

  @override
  void initState() {
    _newPuzzle();

    super.initState();
  }

  void _newPuzzle() {
    puzzle = _getRandomPuzzle();
    _autoFirstMove(puzzle);
    widget.board.setFen(puzzle.fen);
    _lastPlayedFen = puzzle.fen;
    _previousCounter = 0;
    _hasFailed = false;
    setState(() {});
  }

  void _autoFirstMove(Puzzle puzzle) {
    Future.delayed(const Duration(milliseconds: 1000), () {
      final nextMove = puzzle.nextMove(widget.board.toFen);
      selectedSquare = nextMove!;
      BlocProvider.of<BoardBloc>(context).add(
        PieceMoveEvent(board: widget.board, movement: nextMove),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
      bottomNavigationBar: Container(
        color: Colors.grey.shade900,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _bottomMenuButton(
              icon: Icons.arrow_back_ios_rounded,
              onPressed: () {
                _previousCounter++;
                final previousMoveFen = puzzle.previousMoveFen;
                BlocProvider.of<BoardBloc>(context).add(
                  SetFenEvent(board: widget.board, fen: previousMoveFen),
                );
              },
            ),
            _bottomMenuButton(
              icon: Icons.refresh_rounded,
              onPressed: () {
                setState(() {
                  _newPuzzle();
                });
              },
            ),
            _bottomMenuButton(
              icon: Icons.arrow_forward_ios_rounded,
              onPressed: () {
                final nextMove = puzzle.nextMove(widget.board.toFen);
                if (nextMove == null) return;
                BlocProvider.of<BoardBloc>(context).add(
                  PieceMoveEvent(
                    board: widget.board,
                    movement: nextMove,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _bottomMenuButton({
    required IconData icon,
    required Function() onPressed,
  }) =>
      SizedBox(
        width: 60,
        height: 60,
        child: IconButton(
          onPressed: onPressed,
          padding: EdgeInsets.zero,
          icon: Icon(
            icon,
            size: 26,
            color: Colors.grey.shade300,
          ),
        ),
      );

  Widget _body(context, Puzzle puzzle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Column(
              children: [
                Expanded(
                  child: Text(
                    puzzle.title.capitalize(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  puzzle.id,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: _board(context, puzzle),
                  ),
                ),
                if (_hasFailed)
                  const SizedBox(
                    width: double.maxFinite,
                    height: 80,
                    child: Center(
                      child: FailedIcon(),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _board(context, Puzzle puzzle) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: BlocConsumer<BoardBloc, BoardState>(
        listener: (context, state) {
          if (state is BoardInitial) {
            selectedSquare = "";
          } else if (state is BoardMoved) {
            widget.board.recalculateControl();
            setState(() {});
            if (selectedSquare != puzzle.lastMove) {
              if (_previousCounter == 0) {
                setState(() {
                  _hasFailed = true;
                });
              } else {
                _previousCounter--;
              }
            }
            _lastPlayedFen = widget.board.toFen;
            selectedSquare = "";
          }
        },
        builder: (_, state) {
          return GridView.count(
            crossAxisCount: 8,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(64, (index) {
              final square = widget.board.squares[index ~/ 8][index % 8];
              return AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
                decoration: BoxDecoration(
                  color: getColor(index, state, square.coord),
                ),
                child: MaterialButton(
                  onPressed: () {
                    if (selectedSquare.isEmpty) return;

                    _movePieceEvent(square, puzzle);
                  },
                  padding: EdgeInsets.zero,
                  splashColor: Colors.grey.shade900,
                  child: Stack(
                    children: [
                      _cellName(square.coord),
                      if (square.piece != null) _piece(square, context, puzzle),
                      _cellPowerWidget(square),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
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
            fontSize: 10,
          ),
        ),
      );

  String selectedSquare = "";
  String currentFen = "";

  void _selectPieceEvent(Square square) {
    selectedSquare = square.coord;
    BlocProvider.of<BoardBloc>(context).add(
      PieceSelectedEvent(square.coord),
    );
  }

  void _movePieceEvent(Square square, Puzzle puzzle) {
    selectedSquare += square.coord;
    currentFen = widget.board.toFen;
    puzzle.nextMove(currentFen);

    BlocProvider.of<BoardBloc>(context).add(
      PieceMoveEvent(
        board: widget.board,
        movement: selectedSquare,
      ),
    );
  }

  Widget _piece(Square square, context, Puzzle puzzle) => SizedBox(
        width: 1000,
        height: 1000,
        child: MaterialButton(
          onPressed: () {
            if (selectedSquare.isEmpty) {
              _selectPieceEvent(square);
            } else {
              _movePieceEvent(square, puzzle);
            }
          },
          padding: EdgeInsets.zero,
          child: Image.asset(
            square.piece!.imagePath,
          ),
        ),
      );

  Color getColor(int index, BoardState state, String squareCoord) {
    final Color blackCell = Color(0xFF8E806A);
    final Color whiteCell = Color(0xFFC3B091);

    if (state is BoardPlaning) {
      if (state.interactableSquares.map((e) => e.coord).contains(squareCoord)) {
        return Colors.indigo;
      }
    }
    int cellColor = (index % 2);
    int row = (index ~/ 8) % 2;
    if (row == 0) {
      cellColor = (index % 2) == 0 ? 1 : 0;
    }
    return cellColor == 0 ? whiteCell : blackCell;
  }
}
