import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

//Stats card for stats
Widget statsCard({
  required PerfMode mode,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: SizedBox(
            width: 125,
            height: 160,
            child: Container(
              color: mode.color.withOpacity(0.5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mode.color,
                      ),
                      child: Icon(
                        mode.icon,
                        size: 60,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(
                    mode.gameMode.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    mode.ratingString,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ],
  );
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
}

// This enum will be implemented into LichessClient
enum GameMode {
  bullet('Bullet'),
  blitz('Blitz'),
  rapid('Rapid'),
  classical('Classical'),
  daily('Daily'),
  puzzle('Puzzle');

  const GameMode(this.name);

  final String name;
}

// This class will be implemented into LichessClient
class PerfMode {
  final Perf perf;
  final GameMode gameMode;

  PerfMode(this.perf, this.gameMode);
}
