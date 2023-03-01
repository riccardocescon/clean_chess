import 'package:flutter/material.dart';

const blackCell = Color.fromARGB(255, 181, 136, 99);
const whiteCell = Color.fromARGB(255, 240, 217, 181);

Color getCellColor(int index) {
  int cellColor = (index % 2);
  int row = (index ~/ 8) % 2;
  if (row == 0) {
    cellColor = (index % 2) == 0 ? 1 : 0;
  }
  return cellColor == 0 ? whiteCell : blackCell;
}
