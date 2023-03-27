import 'package:flutter/material.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/setting_widgets.dart';

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: universalTextStyle,
        child: Column(
          children: [
            settingSwitch(
                settingName: "Board highlights", value: boardHighlightsValue),
            settingSwitch(
                settingName: "Piece destinations",
                value: pieceDestinationsValue),
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
      ),
      appBar: settingAppBar(context, "Display"),
    );
  }
}

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: universalTextStyle,
        child: Column(
          children: [
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
      ),
      appBar: settingAppBar(context, "Clock"),
    );
  }
}

class Sound extends StatelessWidget {
  const Sound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: universalTextStyle,
        child: Column(
          children: [
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
      ),
      appBar: settingAppBar(context, "Sound"),
    );
  }
}

class Contribute extends StatelessWidget {
  const Contribute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: universalTextStyle,
        child: Column(
          children: [
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
          ],
        ),
      ),
      appBar: settingAppBar(context, "Contribute"),
    );
  }
}

class Themes extends StatelessWidget {
  const Themes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: universalTextStyle,
        child: Column(
          children: [
            settingButton(
                settingName: "Board themes",
                onTap: () {},
                settingIcon: Icons.color_lens),
            settingButton(
                settingName: "Piece set",
                onTap: () {},
                settingIcon: Icons.panorama_wide_angle),
          ],
        ),
      ),
      appBar: settingAppBar(context, "Themes"),
    );
  }
}
