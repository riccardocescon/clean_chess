import 'package:flutter/foundation.dart';

enum LogColor {
  red,
  lightBlue,
}

extension LogColorExtension on LogColor {
  String get color {
    switch (this) {
      case LogColor.red:
        return '\x1B[38;5;196m';
      case LogColor.lightBlue:
        return '\x1B[38;5;51m';
    }
  }
}

void logDebug(String message, {LogColor? color}) {
  if (kDebugMode) {
    if (color != null) {
      debugPrint('${color.color}$message\x1B[0m');
    } else {
      debugPrint(message);
    }
  }
}
