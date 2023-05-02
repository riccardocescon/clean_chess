import 'package:cleanchess/features/clean_chess/data/models/settings/settings.dart';
import 'package:cleanchess/features/clean_chess/data/models/user_settings_model.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/settings/settings_pick_piece_animation_page.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/settings/settings_pick_piece_theme_page.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://github.com/riccardocescon/clean_chess');

class Display extends StatelessWidget {
  const Display({super.key});

  DisplaySettingsModel get display =>
      sl<UserSettingsModel>().displaySettingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                settingIcon: e.icon,
                items: e.options.map((e) => e.name).toList(),
                currentValue: e.valueIndex,
              );
            } else {
              // If used more than once, consider building a PageSwtting class
              return Column(
                children: [
                  _settingPage(
                    settingName: "Pice animation",
                    settingIcon: Icons.animation,
                    context: context,
                    page: const SettingsPickPagePieceAnimationPage(),
                  ),
                  _settingPage(
                    settingName: "Pice theme",
                    settingIcon: Icons.color_lens,
                    context: context,
                    page: SettingsPickPieceThemePage(),
                  ),
                ],
              );
            }
          }).toList()
        ],
      ),
      appBar: _appbar(context, "Display"),
    );
  }
}

class Clock extends StatelessWidget {
  const Clock({super.key});

  ClockSettingsModel get clock => sl<UserSettingsModel>().clockSettingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ...clock.values.map<Widget>((e) {
            if (e is SwitchSetting) {
              return _settingSwitcher(
                settingName: e.name,
                settingIcon: e.icon,
                value: e.value,
              );
            } else if (e is ButtonsSetting) {
              return _settingButtons(
                settingName: e.name,
                settingIcon: e.icon,
                items: e.options.map((e) => e.name).toList(),
                currentValue: e.valueIndex,
              );
            } else {
              throw Exception("Unknown setting type: $e");
            }
          }).toList()
        ],
      ),
      appBar: _appbar(context, "Clock"),
    );
  }
}

class Behavior extends StatelessWidget {
  const Behavior({super.key});

  BehaviorSettingsModel get behavior =>
      sl<UserSettingsModel>().behaviorSettingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: universalTextStyle,
          child: Column(
            children: [
              ...behavior.values.map<Widget>((e) {
                if (e is SwitchSetting) {
                  return _settingSwitcher(
                    settingName: e.name,
                    settingIcon: e.icon,
                    value: e.value,
                  );
                } else if (e is ButtonsSetting) {
                  return _settingButtons(
                    settingName: e.name,
                    settingIcon: e.icon,
                    items: e.options.map((e) => e.name).toList(),
                    currentValue: e.valueIndex,
                  );
                } else {
                  throw Exception("Unknown setting type: $e");
                }
              }).toList()
            ],
          )),
      appBar: _appbar(context, "Behavior"),
    );
  }
}

class Language extends StatelessWidget {
  const Language({super.key});

  LanguageSettingsModel get language =>
      sl<UserSettingsModel>().languageSettingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: universalTextStyle,
          child: Column(
            children: [
              ...language.values.map<Widget>((e) {
                if (e is SwitchSetting) {
                  return _settingSwitcher(
                    settingName: e.name,
                    settingIcon: e.icon,
                    value: e.value,
                  );
                } else if (e is ButtonsSetting) {
                  return _settingButtons(
                    settingName: e.name,
                    settingIcon: e.icon,
                    items: e.options.map((e) => e.name).toList(),
                    currentValue: e.valueIndex,
                  );
                } else {
                  throw Exception("Unknown setting type: $e");
                }
              }).toList()
            ],
          )),
      appBar: _appbar(context, "Language"),
    );
  }
}

class Sound extends StatelessWidget {
  const Sound({super.key});

  SoundSettingsModel get sound => sl<UserSettingsModel>().soundSettingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: universalTextStyle,
          child: Column(
            children: [
              ...sound.values.map<Widget>((e) {
                if (e is SwitchSetting) {
                  return _settingSwitcher(
                    settingName: e.name,
                    settingIcon: e.icon,
                    value: e.value,
                  );
                } else if (e is ButtonsSetting) {
                  return _settingButtons(
                    settingName: e.name,
                    settingIcon: e.icon,
                    items: e.options.map((e) => e.name).toList(),
                    currentValue: e.valueIndex,
                  );
                } else {
                  throw Exception("Unknown setting type: $e");
                }
              }).toList()
            ],
          )),
      appBar: _appbar(context, "Sound"),
    );
  }
}

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  PrivacySettingsModel get privacy =>
      sl<UserSettingsModel>().privacySettingsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
          style: universalTextStyle,
          child: Column(
            children: [
              ...privacy.values.map<Widget>((e) {
                if (e is SwitchSetting) {
                  return _settingSwitcher(
                    settingName: e.name,
                    settingIcon: e.icon,
                    value: e.value,
                  );
                } else if (e is ButtonsSetting) {
                  return _settingButtons(
                    settingName: e.name,
                    settingIcon: e.icon,
                    items: e.options.map((e) => e.name).toList(),
                    currentValue: e.valueIndex,
                  );
                } else {
                  throw Exception("Unknown setting type: $e");
                }
              }).toList()
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
            _animatedButton(items, currentValue),
          ],
        ),
      ),
    ),
  );
}

Widget _animatedButton(
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
                            child: Text(
                              e,
                              textAlign: TextAlign.center,
                            ),
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
