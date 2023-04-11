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
            // items: ["On", "Off", "< 10 seconds"],
            items: ["On", "Off"],
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
            // items: ["On", "Off", "Casual only"],
            items: ["On", "Off"],
          ),
        ],
      ),
      appBar: _appbar(context, "Clock"),
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
      appBar: _appbar(context, "Sound"),
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
          StatefulBuilder(builder: (context, setState) => 
            Row(
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
                        width: 80,
                        height: 30,
                        child: Center(
                          child: Text(e),
                        ),
                      ),
                    ),
                  ),
                )
              ).toList(),
            )
          )
        ],
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
