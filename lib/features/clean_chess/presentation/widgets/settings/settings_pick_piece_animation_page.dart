import 'dart:async';

import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:cleanchess/core/utilities/extentions.dart';
import 'package:cleanchess/features/clean_chess/data/models/user_settings_model.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/titled_app_bar.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:dartchess/dartchess.dart';
import 'package:flutter/material.dart';
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

class SettingsPickPagePieceAnimationPage extends StatefulWidget {
  const SettingsPickPagePieceAnimationPage({super.key});

  @override
  State<SettingsPickPagePieceAnimationPage> createState() =>
      _SettingsPickPagePieceAnimationPageState();
}

class _SettingsPickPagePieceAnimationPageState
    extends State<SettingsPickPagePieceAnimationPage> {
  double get _boardSize => MediaQuery.of(context).size.width * 0.3;
  final double _piecePadding = 4;
  final double _selectorPadding = 10;

  late final int _oldAnimationId;

  late int _selectedId;
  late Timer _animationTimer;
  StateSetter? _selectedBoardRef;
  bool _animate = true;

  @override
  void initState() {
    _oldAnimationId =
        sl<UserSettingsModel>().displaySettingsModel.pieceAnimation!.id;
    _selectedId = _oldAnimationId;
    _animationTimer =
        Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      if (_selectedBoardRef != null) {
        _selectedBoardRef!(() {});
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _animationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _handlePop();
        return true;
      },
      child: BaseScaffold(
        title: 'Settings'.hardcoded,
        subtitle: 'Piece Animations'.hardcoded,
        onPop: _handlePop,
        body: _body(),
      ),
    );
  }

  Widget _body() {
    return GridView.count(
      crossAxisCount: 2,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        for (final anim in PieceAnimation.values) _boardType(anim),
      ],
    );
  }

  Widget _boardType(PieceAnimation animation) {
    return Column(
      children: [
        _board(animation),
        Text(animation.name),
      ],
    );
  }

  Widget _board(PieceAnimation animation) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedId = animation.id;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: _boardSize + _selectorPadding * 2,
        padding: EdgeInsets.all(_selectorPadding),
        decoration: BoxDecoration(
          color: animation.id == _selectedId
              ? Colors.grey.withAlpha(100)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: SizedBox(
          width: _boardSize,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: StatefulBuilder(
                builder: (context, localSetState) {
                  return GridView.count(
                    crossAxisCount: 4,
                    children: List.generate(
                      16,
                      (index) => Container(
                        color: getCellColor(index, boardSize: 4),
                        child: _piece(animation, index, localSetState),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _piece(
    PieceAnimation animation,
    int cellIndex,
    StateSetter localSetState,
  ) {
    Piece? piece = getPiece(animation.id, localSetState, cellIndex);
    return Padding(
      padding: EdgeInsets.all(_piecePadding),
      child: AnimatedBoardPiece(
        onGetPiece: () => piece,
        pieceAnim: animation,
      ),
    );
  }

  Piece? getPiece(int animationId, StateSetter localSetState, int cellIndex) {
    // Animate only the selected board
    bool selectedBoard = _selectedId == animationId;

    // Animations always starts from the 13 cells and ends in the 6 cell
    const sourceCell = 13;
    const targetCell = 6;
    final animationCells = [targetCell, sourceCell];

    // By default the piece is in the source cell
    int destCell = sourceCell;

    // Animate if the board is selected and it's one of the animation cells
    if (selectedBoard && animationCells.contains(cellIndex)) {
      _selectedBoardRef = localSetState;

      // Reset the animation only 1 time for each [_animationTimer] call
      // If we don't do this, the animation will be restarted for each cell
      // that is drawn, in this case 16 times per call.
      // We want to update just 1 time, so we refer this action to a specific cell
      // in this case [targetCell]
      if (cellIndex == targetCell) {
        _animate = !_animate;
      }

      // If we need to adnimate, we override the destination cell
      if (!_animate) {
        destCell = targetCell;
      }
    }

    Piece? piece = cellIndex == destCell ? Piece.whiteKnight : null;
    return piece;
  }

  Future<void> _handlePop() async {
    sl<UserSettingsModel>().displaySettingsModel.setPieceAnimation =
        PieceAnimation.values[_selectedId];
    await secure_storage_helper.saveAnimationType(_selectedId);
  }
}
