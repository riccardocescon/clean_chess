import 'package:clean_chess/chess/models/cell.dart';
import 'package:clean_chess/core/clean_chess/presentation/widgets/hud/power_hud.dart';
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
  final bool innerCoords = true;

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
                if (innerCoords) _innerCoords(),
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

  Widget chessPiece() => Align(
        alignment: Alignment.center,
        child: cell.piece != null
            ? Image.asset(
                cell.piece!.imagePath,
                width: 50,
                height: 50,
              )
            : Container(),
      );
}
