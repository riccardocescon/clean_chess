import 'package:flutter/material.dart';

const blackCell = Color.fromARGB(255, 181, 136, 99);
const whiteCell = Color.fromARGB(255, 240, 217, 181);

Color getCellColor(
  int index, {
  Color? whiteColor,
  Color? blackColor,
  int boardSize = 8,
}) {
  int cellColor = (boardSize % 2 == 0
      ? index % 2
      : index % 2 == 0
          ? 1
          : 0);
  int row = (index ~/ boardSize) % 2;
  if (row == 0) {
    cellColor = (index % 2) == 0 ? 1 : 0;
  }
  return cellColor == 0 ? whiteColor ?? whiteCell : blackColor ?? blackCell;
}

const lightDark = Color(0xFF1B1B1B);
const modeItemHeigth = 80.0;

const heigth5 = SizedBox(height: 5);
const heigth10 = SizedBox(height: 10);
const heigth20 = SizedBox(height: 20);

const width5 = SizedBox(width: 5);
const width10 = SizedBox(width: 10);
const width20 = SizedBox(width: 20);
