import 'package:flutter/foundation.dart';

/// Colors for the [logDebug] function.
///
/// Source: https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
enum LogColor {
  red('\x1B[38;5;196m'),
  green('\x1B[38;5;46m'),
  yellow('\x1B[38;5;226m'),
  lightBlue('\x1B[38;5;195m'),
  magenta('\x1B[38;5;201m'),
  cyan('\x1B[38;5;51m'),
  white('\x1B[38;5;231m'),
  black('\x1B[38;5;16m'),
  gray('\x1B[38;5;244m'),
  orange('\x1B[38;5;208m'),
  pink('\x1B[38;5;217m'),
  purple('\x1B[38;5;141m'),
  brown('\x1B[38;5;130m'),
  teal('\x1B[38;5;48m'),
  lime('\x1B[38;5;154m');

  const LogColor(this.color);

  final String color;
}

void logDebug(
  String message, {
  String? tag,
  LogColor color = LogColor.white,
}) {
  if (kDebugMode) {
    print('${color.color}${tag == null ? "" : "$tag:"} $message\x1B[0m');
  }
}
