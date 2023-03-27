import 'package:cleanchess/features/clean_chess/presentation/widgets/setting_widgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//!
// S = switcher
// P = custom Page
// D = Dropdown
// B = Button with Hypertext

//  Board highlights S
// Piece destinations S
// Board coordinates S
// Move list while playing S
// Move notation D
// Zen mode S

// Clock position D
// Tenths of seconds D
// Sound when time gets critical S
// Give more time S

// Notifications S
// Vibrate on game events S
// Toggle sound S

// Report a Bug B
// Request a Feature B
// Contribute with us B
// Propose a translation B

bool give15secondsValue = false;

final Uri _url = Uri.parse('https://github.com/riccardocescon/clean_chess');
final Uri _urlBug = Uri.parse(
    'https://github.com/riccardocescon/clean_chess/issues/new?assignees=&labels=&template=bug_report.md&title=');
final Uri _urlFeature = Uri.parse(
    'https://github.com/riccardocescon/clean_chess/issues/new?assignees=&labels=&template=feature_request.md&title=');

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: universalTextStyle,
        child: const Text("Hello!"),
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
                settingIcon: Icons.access_time)
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
        child: const Text("Hello!"),
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
                  onTap: _launchUrlBug,
                  settingIcon: Icons.bug_report),
              settingButton(
                  settingName: "Request a feature",
                  onTap: _launchUrlFeature,
                  settingIcon: Icons.question_mark),
              settingButton(
                  settingName: "Contribute with us",
                  onTap: _launchUrl,
                  settingIcon: Icons.code),
              settingButton(
                  settingName: "Propose a translation",
                  onTap: _launchUrl,
                  settingIcon: Icons.translate),
            ],
          )),
      appBar: settingAppBar(context, "Contribute"),
    );
  }
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> _launchUrlBug() async {
  if (!await launchUrl(_urlBug)) {
    throw Exception('Could not launch $_urlBug');
  }
}

Future<void> _launchUrlFeature() async {
  if (!await launchUrl(_urlFeature)) {
    throw Exception('Could not launch $_urlFeature');
  }
}
