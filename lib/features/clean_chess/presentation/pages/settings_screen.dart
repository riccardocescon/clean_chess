import 'package:cleanchess/features/clean_chess/presentation/widgets/setting_widgets.dart';
import 'package:flutter/material.dart';

int index = 0;

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: settingAppBar(context, ""),
    );
  }
}

Widget _body(BuildContext context) {
  return Column(
    children: [
      settingButton(
        settingName: "Display",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Display())),
        settingIcon: Icons.display_settings,
      ),
      settingButton(
        settingName: "Clock",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Clock())),
        settingIcon: Icons.access_time_outlined,
      ),
      // settingButton(
      //   settingName: "Behavior",
      //   onTap: () => Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const Behavior())),
      //   settingIcon: Icons.settings_applications,
      // ),
      // settingButton(
      //   settingName: "Language",
      //   onTap: () => Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const Language())),
      //   settingIcon: Icons.language,
      // ),

      settingButton(
        settingName: "Sound",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Sound())),
        settingIcon: Icons.volume_up,
      ),
      // settingButton(
      //   settingName: "Privacy",
      //   onTap: () => Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const Privacy())),
      //   settingIcon: Icons.privacy_tip,
      // ),
      settingButton(
        settingName: "Themes",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Themes())),
        settingIcon: Icons.color_lens,
      ),
      settingButton(
        settingName: "Contribute",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Contribute())),
        settingIcon: Icons.code,
      ),
    ],
  );
}

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return settingPage(
      context,
      settingName: "Display",
      children: List.of(
        [
          navigateButton(
            settingName: "Piece Animations",
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const PieceAnimations())),
          ),
          SettingSwitch(
              settingName: "Board highlights", val: boardHighlightsValue),
          SettingSwitch(
              settingName: "Piece destinations", val: pieceDestinationsValue),
          SettingSwitch(
              settingName: "Board coordinates", val: boardCoordinatesValue),
          SettingSwitch(
              settingName: "Move list while playing",
              val: moveListWhilePlayingValue),
          SettingSwitch(settingName: "Zen mode", val: zenModeValue),
          TwoButtons(
            settingName: "Move notation",
            buttonText: "Letter",
            buttonText2: "Piece Symbol",
            val: moveNotationValue,
          ),
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
          SettingSwitch(
            val: give15secondsValue,
            settingName: "Give 15 seconds",
          ),
          SettingSwitch(
            val: give15secondsValue,
            settingName: "Sound when time gets critical",
          ),
          TwoButtons(
            settingName: "Clock position",
            buttonText: "Left",
            buttonText2: "Right",
            val: clockPositionValue,
          ),
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
          SettingSwitch(
            val: toggleSoundValue,
            settingName: "Toggle sound",
          ),
          SettingSwitch(
            val: vibrateOnGameEventsValue,
            settingName: "Vibrate on game events",
          ),
          SettingSwitch(
            val: notificationsValue,
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
          navigateButton(
            settingName: "Board themes",
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const BoardThemes())),
          ),
          navigateButton(
            settingName: "Piece sets",
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PieceSets())),
          ),
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
