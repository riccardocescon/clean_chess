import 'package:flutter/material.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/setting_widgets.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(
      context,
      settingName: "Display",
      children: List.of(
        [
          settingButton(
              settingName: "Piece Animations",
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PieceAnimations())),
              settingIcon: Icons.movie_filter),
          settingSwitch(
              settingName: "Board highlights", value: boardHighlightsValue),
          settingSwitch(
              settingName: "Piece destinations", value: pieceDestinationsValue),
          settingSwitch(
              settingName: "Board coordinates", value: boardCoordinatesValue),
          settingSwitch(
              settingName: "Move list while playing",
              value: moveListWhilePlayingValue),
          settingSwitch(settingName: "Zen mode", value: zenModeValue),
          twoButtons(
              settingName: "Board notation",
              buttonText: "Chess piece symbol",
              buttonText2: "Letter"),
        ],
      ),
    );
  }
}

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(
      context,
      settingName: "Clock",
      children: List.of(
        [
          settingSwitch(
            value: give15secondsValue,
            settingName: "Give 15 seconds",
          ),
          settingSwitch(
            value: give15secondsValue,
            settingName: "Sound when time gets critical",
          ),
          twoButtons(
              settingName: "Clock position",
              buttonText: "Left",
              buttonText2: "Right"),
        ],
      ),
    );
  }
}

class Sound extends StatelessWidget {
  const Sound({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(
      context,
      settingName: "Sound",
      children: List.of(
        [
          settingSwitch(
            value: toggleSoundValue,
            settingName: "Toggle sound",
          ),
          settingSwitch(
            value: vibrateOnGameEventsValue,
            settingName: "Vibrate on game events",
          ),
          settingSwitch(
            value: notificationsValue,
            settingName: "Notifications",
          ),
        ],
      ),
    );
  }
}

class Contribute extends StatelessWidget {
  const Contribute({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(context,
        settingName: "Contribute",
        children: List.of([
          settingButton(
              settingName: "Report a bug",
              onTap: launchUrlBug,
              settingIcon: Icons.bug_report),
          settingButton(
              settingName: "Request a feature",
              onTap: launchUrlFeature,
              settingIcon: Icons.question_mark),
          settingButton(
              settingName: "Contribute with us",
              onTap: launchUrlPage,
              settingIcon: Icons.code),
          settingButton(
              settingName: "Propose a translation",
              onTap: launchUrlPage,
              settingIcon: Icons.translate),
        ]));
  }
}

class Themes extends StatelessWidget {
  const Themes({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(
      context,
      settingName: "Themes",
      children: List.of(
        [
          settingButton(
              settingName: "Board themes",
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const BoardThemes())),
              settingIcon: Icons.color_lens),
          settingButton(
              settingName: "Piece sets",
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const PieceSets())),
              settingIcon: Icons.pie_chart),
        ],
      ),
    );
  }
}

class BoardThemes extends StatelessWidget {
  const BoardThemes({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(context,
        settingName: "Board themes", children: List.empty());
  }
}

class PieceSets extends StatelessWidget {
  const PieceSets({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(context,
        settingName: "Piece sets", children: List.empty());
  }
}

class PieceAnimations extends StatelessWidget {
  const PieceAnimations({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(context,
        settingName: "Piece Animations", children: List.empty());
  }
}
