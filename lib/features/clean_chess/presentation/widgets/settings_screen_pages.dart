// import 'package:dartz/dartz.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//!
// S = switcher
// P = custom Page
// D = Dropdown
// B = Button with Hypertext

// Board highlights S
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

final Uri _url = Uri.parse('https://github.com/riccardocescon/clean_chess');

class Display extends StatelessWidget {
  const Display({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _settingPage(
            settingName: "Pice animation",
            settingIcon: Icons.animation,
            context: context,
            // page: const PieceAnimation(),
            page: const Homepage(),
          ),
          _settingSwitcher(
            settingName: "Magnified dragged pieces",
            settingIcon: Icons.search,
            value: true,
          ),
          _settingSwitcher(
            settingName: "Board highlights",
            value: false,
          ),
          _settingSwitcher(
            settingName: "Move list while playing",
            value: true,
          ),
          _settingSwitcher(
            settingName: "Piece destinations",
            settingIcon: Icons.arrow_forward,
            value: true,
          ),
          _settingSwitcher(
            settingName: "Board coordinates",
            settingIcon: Icons.grid_on,
            value: true,
          ),
          _settingSwitcher(
            settingName: "Move list while playing",
            value: false,
          ),
          _settingButtons(
            settingName: "Move notation",
            items: ["Pieces", "Letters"],
          ),
          _settingSwitcher(
            settingName: "Zen mode",
            settingIcon: Icons.remove_red_eye,
            value: true,
          ),
          _settingSwitcher(
            settingName: "Blindfold chess",
            value: true,
          ),
          _settingButtons(
            settingName: "Board screen side",
            items: ["Left", "Right"]
          ),
          _settingButtons(
            settingName: "Board orientation",
            items: ["White on bottom", "Black on bottom"]
          ),
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
          ),
          _settingButtons(
            settingName: "Tenths of seconds",
            settingIcon: Icons.timer,
            items: ["On", "Off", "< 10 seconds"],
          ),
          _settingSwitcher(
            settingName: "Progress bar",
            value: true,
          ),
          _settingSwitcher(
            settingName: "Sound when time gets critical",
            settingIcon: Icons.notifications_active,
            value: true,
          ),
          _settingButtons(
            settingName: "Give more time",
            settingIcon: Icons.fast_forward,
            items: ["On", "Off", "Casual only"],
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
            ),
            _settingSwitcher(
              settingName: "Premoves",
              settingIcon: Icons.zoom_out_map,
              value: true
            ),
            _settingButtons(
              settingName: "Takebacks",
              settingIcon: Icons.threesixty,
              items: ["Never", "Always", "Casual only"],
            ),
            _settingButtons(
              settingName: "Promote to queen",
              items: ["Never", "Always", "When premoving"],
            ),
            _settingButtons(
              settingName: "Draw on threefold",
              items: ["Never", "Always", "< 30 seconds"],
            ),
            _settingSwitcher(
              settingName: "Confirm resignation and draw offers",
              value: true
            ),
            _settingButtons(
              settingName: "To castle move king",
              items: ["Two squares", "Onto rook"],
            ),
            _settingSwitcher(
              settingName: "Input moves with keyboard",
              settingIcon: Icons.keyboard,
              value: true
            ),
            _settingSwitcher(
              settingName: "Snap arrows to valid moves",
              settingIcon: Icons.arrow_outward,
              value: true
            ),
            _settingSwitcher(
              settingName: "Say \"Good game\" upon defeat or draw",
              settingIcon: Icons.sentiment_satisfied,
              value: true
            ),
          ],
        )
      ),
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
              items: ["English", "Italian", "Spanish", "Turkish"]
            ),
          ],
        )
      ),
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
              value: true,
            ),
            _settingSwitcher(
              settingName: "Vibrate on game events",
              settingIcon: Icons.vibration,
              value: true,
            ),
            _settingSwitcher(
              settingName: "Toggle sound",
              settingIcon: Icons.volume_up,
              value: true,
            ),
          ],
        )
      ),
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
              value: true,
            ),
            _settingButtons(
              settingName: "Let others challenge you",
              settingIcon: Icons.shield,
              items: ["Never", "Always", "Friends", "Registered", "Rating is ± 300"]
            ),
            _settingButtons(
              settingName: "Let others message you",
              settingIcon: Icons.message,
              items: ["Always", "Friends", "Only existing conversations"]
            ),
            _settingButtons(
              settingName: "Let others invite to study",
              settingIcon: Icons.shield,
              items: ["Never", "Always", "Friends"]
            ),
            _settingButtons(
              settingName: "Share chess insights",
              settingIcon: Icons.bar_chart,
              items: ["No one", "Friends", "Everyone"]
            ),
          ],
        )
      ),
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


Widget _settingSwitcher(
    {required String settingName,
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
              border:  Border.all(color: Colors.grey.shade800, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: StatefulBuilder(builder: (context, setState) => 
              CupertinoSwitch(
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

Widget _settingButtons(
  {required String settingName,
  required List<String> items,
  IconData settingIcon = Icons.settings,
  int currentValue = 0}
) {
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
            StatefulBuilder(builder: (context, setState) => 
              SizedBox(
                width: 200,
                child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  spacing: 8,
                  runSpacing: 8,
                  children: items.map((e) => 
                    Padding(
                      padding: const EdgeInsets.only(left: 12),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            currentValue = items.indexOf(e);
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: currentValue == items.indexOf(e) ? Colors.transparent : Colors.grey.shade800, width: 2),
                            borderRadius: BorderRadius.circular(8),
                            color: currentValue == items.indexOf(e) ? Colors.pink : Colors.transparent
                          ),
                          child: SizedBox(
                            width: items.indexOf(e) == (items.length -1) && items.length % 2 == 1 ? 190 : 80,
                            height: 30,
                            child: Center(
                              child: Text(e),
                            ),
                          ),
                        ),
                      ),
                    )
                  ).toList(),
                ),
              )
            )
          ],
        ),
      ),
    ),
  );
}

Widget _settingPage (
  {required String settingName,
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
