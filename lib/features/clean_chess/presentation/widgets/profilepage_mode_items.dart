import 'package:flutter/material.dart';

List<Widget> modeItems = [
  statsCard(
    gameMode: "Bullet",
    elo: "1322",
    icon: Icons.speed,
    statsCardColor: const Color.fromARGB(223, 214, 25, 88),
  ),
  statsCard(
    gameMode: "Blitz",
    elo: "2114",
    icon: Icons.flash_on,
    statsCardColor: const Color.fromARGB(223, 138, 249, 54),
  ),
  statsCard(
    gameMode: "Rapid",
    elo: "954",
    icon: Icons.timer,
    statsCardColor: const Color.fromARGB(223, 21, 173, 255),
  ),
  statsCard(
    gameMode: "Classical",
    elo: "771",
    icon: Icons.house,
    statsCardColor: const Color.fromARGB(223, 214, 25, 88),
  ),
  statsCard(
    gameMode: "Daily",
    elo: "2731",
    icon: Icons.sunny,
    statsCardColor: const Color.fromARGB(223, 138, 249, 54),
  ),
  statsCard(
    gameMode: "Puzzles",
    elo: "1533",
    icon: Icons.lightbulb,
    statsCardColor: const Color.fromARGB(223, 21, 173, 255),
  ),
];

//Stats card for stats
Widget statsCard({
  required String gameMode,
  required String elo,
  required IconData icon,
  required Color statsCardColor,
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
              color: statsCardColor.withOpacity(0.5),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Container(
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: statsCardColor,
                      ),
                      child: Icon(
                        icon,
                        size: 60,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Text(gameMode,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500)),
                  Text(
                    elo,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500),
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
