// import 'package:dartz/dartz.dart';
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
          _settingDropdown(
            settingName: "Pice animation",
            settingIcon: Icons.animation,
            items: [ "None", "Slow", "Normal", "Fast"],
            currentValue: "Normal", //optional
          ),
          _settingSwitcher(
            settingName: "Board highlights",
            value: false,
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
            settingIcon: Icons.list,
            value: false,
          ),
          _settingDropdown(
            settingName: "Move notation",
            settingIcon: Icons.format_list_numbered,
            items: ["Chess pieces", "Letters"],
          ),
          _settingSwitcher(
            settingName: "Zen mode",
            settingIcon: Icons.remove_red_eye,
            value: true,
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
      body: DefaultTextStyle(
        style: universalTextStyle,
        child: const Text("Hello!"),
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
          StatefulBuilder(builder: (context, setState) => 
          Switch(
            activeTrackColor: Colors.pink,
            inactiveTrackColor: Colors.transparent,
            thumbColor: MaterialStateProperty.all(Colors.white),
            value: value,
            // if we want the thumb to have the same size between active and inactive this is the only solution i found
            thumbIcon: MaterialStateProperty.all(
              Icon(
                value ? Icons.check : Icons.close,
                color: Colors.white,
              ),
            ),
            onChanged: (bool newValue) {
              setState(() {
                value = newValue;
              });
            },
          ),
          )
        ],
      ),
    ),
  );
}

Widget _settingDropdown(
    {required String settingName,
    required IconData settingIcon,
    required List<String> items,
    String currentValue = ""}) {
  String value = items[0];
  return DefaultTextStyle(
    style: universalTextStyle,
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
          const Spacer(),
          StatefulBuilder(builder: (context, setState) => 
            DropdownButton<String>(
              value: value,
              icon: const Icon(Icons.arrow_forward_ios),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(height: 0),
              onChanged: (String? newValue) {
                setState(() {
                  value = newValue!;
                });
              },
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          )
        ],
      ),
    ),
  );
}

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
