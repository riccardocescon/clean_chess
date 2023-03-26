import 'package:flutter/material.dart';

class StatsCard extends StatelessWidget {
  const StatsCard({
    super.key,
    required this.gameMode,
    required this.elo,
    required this.icon,
    required this.statsCardColor,
  });

  final String gameMode;

  final int elo;

  final IconData icon;

  final Color statsCardColor;

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                            fontWeight: FontWeight.w500)),
                    Text(
                      "$elo",
                      style: TextStyle(
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                          fontWeight: FontWeight.w500),
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
}

List<Widget> modeItems = [
  const StatsCard(
    gameMode: "Bullet",
    elo: 1322,
    icon: Icons.speed,
    statsCardColor: Color.fromARGB(223, 214, 25, 88),
  ),
  const StatsCard(
    gameMode: "Blitz",
    elo: 2114,
    icon: Icons.flash_on,
    statsCardColor: Color.fromARGB(223, 138, 249, 54),
  ),
  const StatsCard(
    gameMode: "Rapid",
    elo: 954,
    icon: Icons.timer,
    statsCardColor: Color.fromARGB(223, 21, 173, 255),
  ),
  const StatsCard(
    gameMode: "Classical",
    elo: 771,
    icon: Icons.house,
    statsCardColor: Color.fromARGB(223, 214, 25, 88),
  ),
  const StatsCard(
    gameMode: "Daily",
    elo: 2731,
    icon: Icons.sunny,
    statsCardColor: Color.fromARGB(223, 138, 249, 54),
  ),
  const StatsCard(
    gameMode: "Puzzles",
    elo: 1533,
    icon: Icons.lightbulb,
    statsCardColor: Color.fromARGB(223, 21, 173, 255),
  ),
];
