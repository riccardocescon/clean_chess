import 'package:cleanchess/features/clean_chess/presentation/widgets/profilepage_mode_items.dart';
import 'package:dartchess/dartchess.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

extension EitherHelper<L, R> on Either<L, R> {
  // Get [Left] value, may throw an exception when the value is [Right]
  L get left => fold<L>(
        (value) => value,
        (right) => throw Exception(
          'Illegal use. You should check isLeft before calling',
        ),
      );

  /// Get [Right] value, may throw an exception when the value is [Left]
  R get right => fold<R>(
        (left) => throw Exception(
          'Illegal use. You should check isRight before calling',
        ),
        (value) => value,
      );
  bool get isLeft => this is Left<L, R>;
}

extension GameModeColor on GameMode {
  Color get color {
    final colors = {
      GameMode.bullet: Colors.pink,
      GameMode.blitz: Colors.green,
      GameMode.rapid: Colors.blue,
      GameMode.classical: Colors.pink,
      GameMode.daily: Colors.green,
      GameMode.puzzle: Colors.blue,
    };

    return colors[this]!;
  }
}

extension PerfModeUtils on PerfMode {
  String get ratingString => perf.rating?.toString() ?? "{None}";

  Color get color {
    final colors = {
      GameMode.bullet: const Color.fromARGB(223, 214, 25, 88),
      GameMode.blitz: const Color.fromARGB(223, 138, 249, 54),
      GameMode.rapid: const Color.fromARGB(223, 21, 173, 255),
      GameMode.classical: const Color.fromARGB(223, 214, 25, 88),
      GameMode.daily: const Color.fromARGB(223, 138, 249, 54),
      GameMode.puzzle: const Color.fromARGB(223, 21, 173, 255),
    };

    return colors[gameMode] ?? Colors.black;
  }

  IconData get icon {
    final icons = {
      GameMode.bullet: Icons.speed,
      GameMode.blitz: Icons.flash_on,
      GameMode.rapid: Icons.timer,
      GameMode.classical: Icons.house,
      GameMode.daily: Icons.sunny,
      GameMode.puzzle: Icons.lightbulb,
    };

    return icons[gameMode] ?? Icons.error;
  }

  PerfType get perfType {
    final perfTypes = {
      GameMode.bullet: PerfType.bullet,
      GameMode.blitz: PerfType.blitz,
      GameMode.rapid: PerfType.rapid,
      GameMode.classical: PerfType.classical,
      GameMode.daily: PerfType.correspondence,
    };

    return perfTypes[gameMode] ?? PerfType.bullet;
  }
}

extension DateTimeUtils on DateTime {
  String get monthName => DateFormat('MMMM').format(this);
}

extension StringUtils on String {
  String get capitalize => '${this[0].toUpperCase()}${substring(1)}';

  // Useful for finding all the occurences of hardcoded Strings in order
  // to add translations when needed. Make sure to use this when
  // writing hardcoded Strings that needs to be translated.
  String get hardcoded => this;

  String replaceLast({required String from, required String to}) {
    final lastIndex = lastIndexOf(from);
    if (lastIndex == -1) return this;
    return replaceRange(lastIndex, lastIndex + from.length, to);
  }
}

extension SideUtil on Side {
  bool get isWhite => this == Side.white;
  bool get isBlack => this == Side.black;
}
