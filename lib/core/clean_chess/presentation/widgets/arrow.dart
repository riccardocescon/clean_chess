import 'package:cleanchess/core/cleanchess/clippers/arrow_head_clipper.dart';
import 'package:cleanchess/core/cleanchess/painters/arrow_head_painter.dart';
import 'package:flutter/material.dart';

class Arrow extends StatelessWidget {
  const Arrow({
    super.key,
    required this.from,
    required this.to,
    this.color,
  });

  final GlobalKey from;
  final GlobalKey to;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    const arrowThickness = 8.0;
    const arrowHeadSize = 23.0;

    final fromCellRenderBox =
        from.currentContext!.findRenderObject() as RenderBox;
    final toCellRenderBox = to.currentContext!.findRenderObject() as RenderBox;

    final fromCellPos = fromCellRenderBox.localToGlobal(Offset.zero) +
        Offset(
          fromCellRenderBox.size.width / 2,
          fromCellRenderBox.size.height / 2 - arrowThickness / 2,
        );
    final toCellPos = toCellRenderBox.localToGlobal(Offset.zero) +
        Offset(
          toCellRenderBox.size.width / 2,
          toCellRenderBox.size.height / 2 - arrowThickness / 2,
        );
    final angledLength = (toCellPos - fromCellPos).distance;
    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            left: fromCellPos.dx,
            top: fromCellPos.dy - arrowThickness * 1.5,
            child: Transform.rotate(
              angle: (toCellPos - fromCellPos).direction,
              alignment: Alignment.centerLeft,
              child: _straigthArrow(
                angledLength,
                arrowThickness,
                arrowHeadSize,
                (toCellPos - fromCellPos).direction,
                color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _straigthArrow(width, heigth, headSize, angle, Color? color) => SizedBox(
      width: width,
      height: heigth * 4,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: width,
              height: heigth - 2,
              decoration: BoxDecoration(
                color: (color ?? Colors.grey.shade900).withAlpha(200),
                borderRadius: BorderRadius.circular(heigth / 2),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: ClipPath(
              clipper: ArrowHeadClipper(),
              child: SizedBox(
                width: headSize,
                height: headSize * 1.3,
                child: CustomPaint(
                  painter: ArrowHeadPainter(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
