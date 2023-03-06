import 'package:cleanchess/chess/models/cell.dart';
import 'package:cleanchess/core/cleanchess/presentation/widgets/hud/power_hud.dart';
import 'package:flutter/material.dart';

class BoardCell extends StatelessWidget {
  const BoardCell({
    super.key,
    required this.cell,
    required this.cellKey,
    required this.color,
    required this.splashColor,
    required this.isLandscape,
    required this.showPowerHud,
    required this.onTap,
  });

  final Cell cell;
  final GlobalObjectKey cellKey;
  final Color color;
  final Color splashColor;
  final bool isLandscape;
  final bool showPowerHud;
  final void Function() onTap;
  final bool innerCoords = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      key: cellKey,
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: color,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          splashColor: splashColor,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Stack(
              children: [
                ..._cellCoords(),
                if (showPowerHud)
                  PowerHud(
                    whitePower: cell.whitePower.toString(),
                    blackPower: cell.blackPower.toString(),
                  ),
                chessPiece(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _cellCoords() => innerCoords
      ? [_innerCoords()]
      : [
          _outerCoords(),

          // a1 cell has both coords, so we need to override the isRow
          // parameter to print out the column coord instead of the row coord
          if (cell.coord == 'a1') _outerCoords(overrideIsRow: false),
        ];

  Widget _innerCoords() => Align(
        alignment: Alignment.topLeft,
        child: Text(
          cell.coord,
          style: TextStyle(
            fontSize: isLandscape ? 12 : 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget _outerCoords({bool? overrideIsRow}) {
    if (cell.row != 1 && cell.column != 'a') {
      return Container();
    }
    final isRow = overrideIsRow ?? cell.row == 1;
    return Align(
      alignment: isRow ? Alignment.bottomRight : Alignment.topLeft,
      child: Text(
        isRow ? cell.column : cell.row.toString(),
        style: TextStyle(
          fontSize: isLandscape ? 12 : 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget chessPiece() => Align(
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: _scaleTransition,
          child: cell.piece != null
              ? Image.asset(
                  cell.piece!.imagePath,
                  width: 50,
                  height: 50,
                )
              : Container(),
        ),
      );

  Widget _scaleTransition(Widget child, Animation<double> animation) {
    return ScaleTransition(
      scale: animation,
      child: child,
    );
  }
}
