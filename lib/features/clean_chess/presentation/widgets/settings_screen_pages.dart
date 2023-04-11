import 'package:cleanchess/features/clean_chess/data/models/settings/settings.dart';
import 'package:cleanchess/features/clean_chess/data/models/user_settings_model.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//TODO: fetch those data with APIs
final UserSettingsModel _userSettingsModel = UserSettingsModel.test();

// clock
int _clockPosition = 0; // 0 = top, 1 = bottom
int _tenthsOfSeconds = 0; // 0 = on, 1 = off, 2 = < 10 seconds
bool _progressbar = true;
bool _soundWhenTimeGetsCritical = true;
int _giveMoreTime = 0; // 0 = on, 1 = off, 2 = casual only

// behavior
int _moveType = 0; // 0 = tap, 1 = drag, 2 + either
bool _premove = true;
int _takebacks = 0; // 0 = never, 1 = always, 2 = casual only
int _promoteToQueen = 0; // 0 = never, 1 = always, 2 = when premoving
int _drawOnThreefoldRepetition = 0; // 0 = never, 1 = always, 2 = < 30 seconds
bool _confirmResignation = true;
int _castlingMode = 0; // 0 = two squares, 1 = onto rook
bool _keyboardInput = false;
bool _snapArrows = true;
bool _goodGameAfterDefeat = true;

// language
// maybe this should be changed to a string
int _language = 0; // 0 = english, 1 = italian

// themes

// sound
bool _notifications = true;
bool _vibrate = true;
bool _sound = true;

// privacy
bool _follow = true;
int _challenge = 0;
int _message = 0;
int _study = 0;
int _chessInsights = 0;

final Uri _url = Uri.parse('https://github.com/riccardocescon/clean_chess');

class Display extends StatelessWidget {
  const Display({super.key});

  DisplaySettingsModel get display => _userSettingsModel.displaySettingsModel;

  ClockSettingsModel get clock => _userSettingsModel.clockSettingsModel;

  BehaviorSettingsModel get behavior =>
      _userSettingsModel.behaviorSettingsModel;

  LanguageSettingsModel get language =>
      _userSettingsModel.languageSettingsModel;

  SoundSettingsModel get sound => _userSettingsModel.soundSettingsModel;

  PrivacySettingsModel get privacy => _userSettingsModel.privacySettingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // If used more than once, consider building a PageSwtting class
          _settingPage(
            settingName: "Pice animation",
            settingIcon: Icons.animation,
            context: context,
            // page: const PieceAnimation(),
            page: const Homepage(),
          ),

          // Convert all display settings into widgets and add them to this column
          ...display.values.map<Widget>((e) {
            if (e is SwitchSetting) {
              return _settingSwitcher(
                settingName: e.name,
                settingIcon: e.icon,
                value: e.value,
              );
            } else if (e is ButtonsSetting) {
              return _settingButtons(
                settingName: e.name,
                items: e.options.map((e) => e.name).toList(),
                currentValue: e.valueIndex,
              );
            } else {
              throw Exception("Unknown setting type: $e");
            }
          }).toList()

          // ...clock.values.map<Widget>((e) { ...
          // same for others
        ],
      ),
      appBar: _appbar(context, "Display"),
    );
  }
}

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _settingButtons(
            settingName: "Clock position",
            items: ["Top", "Bottom"],
            currentValue: _clockPosition,
          ),
          _settingButtons(
            settingName: "Tenths of seconds",
            settingIcon: Icons.timer,
            items: ["On", "Off", "< 10 seconds"],
            currentValue: _tenthsOfSeconds,
          ),
          _settingSwitcher(
            settingName: "Progress bar",
            value: true,
          ),
          _settingSwitcher(
            settingName: "Sound when time gets critical",
            settingIcon: Icons.notifications_active,
            value: _soundWhenTimeGetsCritical,
          ),
          _settingButtons(
            settingName: "Give more time",
            settingIcon: Icons.fast_forward,
            items: ["On", "Off", "Casual only"],
            currentValue: _giveMoreTime,
          ),
        ],
      ),
      appBar: _appbar(context, "Clock"),
    );
  }
}

class Behavior extends StatelessWidget {
  const Behavior({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: universalTextStyle,
          child: Column(
            children: [
              _settingButtons(
                settingName: "Move type",
                settingIcon: Icons.input,
                items: ["Click", "Drag", "Either"],
                currentValue: _moveType,
              ),
              _settingSwitcher(
                settingName: "Premoves",
                settingIcon: Icons.zoom_out_map,
                value: _premove,
              ),
              _settingButtons(
                settingName: "Takebacks",
                settingIcon: Icons.threesixty,
                items: ["Never", "Always", "Casual only"],
                currentValue: _takebacks,
              ),
              _settingButtons(
                settingName: "Promote to queen",
                items: ["Never", "Always", "When premoving"],
                currentValue: _promoteToQueen,
              ),
              _settingButtons(
                settingName: "Draw on threefold",
                items: ["Never", "Always", "< 30 seconds"],
                currentValue: _drawOnThreefoldRepetition,
              ),
              _settingSwitcher(
                settingName: "Confirm resignation and draw offers",
                value: _confirmResignation,
              ),
              _settingButtons(
                settingName: "To castle move king",
                items: ["Two squares", "Onto rook"],
                currentValue: _castlingMode,
              ),
              _settingSwitcher(
                settingName: "Input moves with keyboard",
                settingIcon: Icons.keyboard,
                value: _keyboardInput,
              ),
              _settingSwitcher(
                settingName: "Snap arrows to valid moves",
                settingIcon: Icons.arrow_outward,
                value: _snapArrows,
              ),
              _settingSwitcher(
                settingName: "Say \"Good game\" upon defeat or draw",
                settingIcon: Icons.sentiment_satisfied,
                value: _goodGameAfterDefeat,
              ),
            ],
          )),
      appBar: _appbar(context, "Behavior"),
    );
  }
}

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: universalTextStyle,
          child: Column(
            children: [
              _settingButtons(
                settingName: "Language",
                settingIcon: Icons.flag,
                items: ["English", "Italian", "Spanish", "Turkish"],
                currentValue: _language,
              ),
            ],
          )),
      appBar: _appbar(context, "Language"),
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
        child: const Text("Themes"),
      ),
      appBar: _appbar(context, "Theme"),
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
              _settingSwitcher(
                settingName: "Notifications",
                settingIcon: Icons.notifications,
                value: _notifications,
              ),
              _settingSwitcher(
                settingName: "Vibrate on game events",
                settingIcon: Icons.vibration,
                value: _vibrate,
              ),
              _settingSwitcher(
                settingName: "Toggle sound",
                settingIcon: Icons.volume_up,
                value: _sound,
              ),
            ],
          )),
      appBar: _appbar(context, "Sound"),
    );
  }
}

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: universalTextStyle,
          child: Column(
            children: [
              _settingSwitcher(
                settingName: "Let others follow you",
                settingIcon: Icons.person,
                value: _follow,
              ),
              _settingButtons(
                settingName: "Let others challenge you",
                settingIcon: Icons.shield,
                items: [
                  "Never",
                  "Always",
                  "Friends",
                  "Registered",
                  "Rating is ± 300"
                ],
                currentValue: _challenge,
              ),
              _settingButtons(
                settingName: "Let others message you",
                settingIcon: Icons.message,
                items: ["Always", "Friends", "Only existing conversations"],
                currentValue: _message,
              ),
              _settingButtons(
                settingName: "Let others invite to study",
                settingIcon: Icons.shield,
                items: ["Never", "Always", "Friends"],
                currentValue: _study,
              ),
              _settingButtons(
                settingName: "Share chess insights",
                settingIcon: Icons.bar_chart,
                items: ["No one", "Friends", "Everyone"],
                currentValue: _chessInsights,
              ),
            ],
          )),
      appBar: _appbar(context, "Privacy"),
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
              _settingButton(
                  settingName: "Report a bug",
                  onTap: _launchUrl,
                  settingIcon: Icons.bug_report),
              _settingButton(
                  settingName: "Request a feature",
                  onTap: _launchUrl,
                  settingIcon: Icons.question_mark),
              _settingButton(
                  settingName: "Contribute with us",
                  onTap: _launchUrl,
                  settingIcon: Icons.code),
              _settingButton(
                  settingName: "Propose a translation",
                  onTap: _launchUrl,
                  settingIcon: Icons.translate),
            ],
          )),
      appBar: _appbar(context, "Contribute"),
    );
  }
}

AppBar _appbar(BuildContext context, String pageName) {
  return AppBar(
    title: DefaultTextStyle(
      style: universalTextStyle,
      child: Column(
        children: [
          Text("Settings",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
          Text(
            pageName,
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                color: Colors.grey),
          )
        ],
      ),
    ),
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () => Navigator.of(context).pop(),
    ),
  );
}

TextStyle universalTextStyle = const TextStyle(
  color: Colors.white,
);

Widget _settingButton(
    {required String settingName,
    required void Function() onTap,
    required IconData settingIcon}) {
  return DefaultTextStyle(
    style: universalTextStyle,
    child: InkWell(
      onTap: onTap,
      child: Container(
        color: const Color.fromARGB(225, 19, 19, 19),
        width: 400,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(settingIcon),
            ),
            Text(settingName),
          ],
        ),
      ),
    ),
  );
}

Widget _settingSwitcher({
  required String settingName,
  required bool value,
  IconData settingIcon = Icons.settings,
}) {
  return DefaultTextStyle(
    style: universalTextStyle,
    child: Container(
      color: const Color.fromARGB(225, 19, 19, 19),
      width: 400,
      height: 50,
      child: Row(
        children: [
          settingIcon != Icons.settings
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(settingIcon),
                )
              : const SizedBox(width: 40),
          Text(settingName),
          const Spacer(),
          //best border i could do
          Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade800, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: StatefulBuilder(
              builder: (context, setState) => CupertinoSwitch(
                activeColor: Colors.pink,
                trackColor: Colors.black,
                value: value,
                onChanged: (bool newValue) {
                  setState(() {
                    value = newValue;
                  });
                },
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _settingButtons({
  required String settingName,
  required List<String> items,
  IconData settingIcon = Icons.settings,
  int currentValue = 0,
}) {
  return DefaultTextStyle(
    style: universalTextStyle,
    child: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: 400,
        // height: 50,
        child: Row(
          children: [
            settingIcon != Icons.settings
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(settingIcon),
                  )
                : const SizedBox(width: 40),
            Text(settingName),
            const Spacer(),
            _aniamtedButton(items, currentValue),
          ],
        ),
      ),
    ),
  );
}

Widget _aniamtedButton(
  List<String> items,
  int currentValue,
) {
  return StatefulBuilder(
    builder: (context, setState) {
      return SizedBox(
        width: 200,
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 8,
          runSpacing: 8,
          children: items
              .map((e) => Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          currentValue = items.indexOf(e);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: currentValue == items.indexOf(e)
                                    ? Colors.transparent
                                    : Colors.grey.shade800,
                                width: 2),
                            borderRadius: BorderRadius.circular(8),
                            color: currentValue == items.indexOf(e)
                                ? Colors.pink
                                : Colors.transparent),
                        child: SizedBox(
                          width: items.indexOf(e) == (items.length - 1) &&
                                  items.length % 2 == 1
                              ? 190
                              : 80,
                          height: 30,
                          child: Center(
                            child: Text(e),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        ),
      );
    },
  );
}

Widget _settingPage({
  required String settingName,
  required Widget page,
  required context,
  IconData settingIcon = Icons.settings,
}) {
  return DefaultTextStyle(
    style: universalTextStyle,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: SizedBox(
        width: 400,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(settingIcon),
            ),
            Text(settingName),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    ),
  );
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
