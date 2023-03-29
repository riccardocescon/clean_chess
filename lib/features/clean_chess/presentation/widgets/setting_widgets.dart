import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
// ignore: todo
//TODO LIST:
// 2 buttons widget
// setstates on value changes & save values somewhere
// themes & piece sets pages
// better icons

bool boardHighlightsValue = false;
bool pieceDestinationsValue = true;
bool boardCoordinatesValue = true;
bool moveListWhilePlayingValue = false;
bool moveNotationValue = false; //True = chess piece symbol, false = letter
bool zenModeValue = true;

bool clockPositionValue = false; //True = left, false = right
bool criticalTimeSoundValue = false;
bool give15secondsValue = false;

bool notificationsValue = false;
bool vibrateOnGameEventsValue = false;
bool toggleSoundValue = false;

TextStyle universalTextStyle = const TextStyle(
  color: Colors.white,
);

final Uri _url = Uri.parse('https://github.com/riccardocescon/clean_chess');
final Uri _urlBug = Uri.parse(
    'https://github.com/riccardocescon/clean_chess/issues/new?assignees=&labels=&template=bug_report.md&title=');
final Uri _urlFeature = Uri.parse(
    'https://github.com/riccardocescon/clean_chess/issues/new?assignees=&labels=&template=feature_request.md&title=');

Widget settingPage(BuildContext context,
    {required String settingName, required List<Widget> children}) {
  return Scaffold(
    body: DefaultTextStyle(
      style: universalTextStyle,
      child: Column(
        children: children,
      ),
    ),
    appBar: settingAppBar(context, settingName),
  );
}

AppBar settingAppBar(BuildContext context, String pageName) {
  return AppBar(
    title: DefaultTextStyle(
      style: universalTextStyle,
      child: Column(
        children: [
          Text("Settings",
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
          Visibility(
            visible: pageName != "" ? true : false, //For the main settings page
            child: Text(
              pageName,
              style: TextStyle(
                  fontSize: Theme.of(context).textTheme.titleSmall?.fontSize,
                  color: Colors.grey),
            ),
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

Widget settingButton(
    {required String settingName,
    required void Function() onTap,
    required IconData settingIcon}) {
  return DefaultTextStyle(
    style: universalTextStyle,
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 400,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 5),
              child: Icon(settingIcon),
            ),
            Text(settingName),
          ],
        ),
      ),
    ),
  );
}

Widget navigateButton({
  required String settingName,
  required void Function() onTap,
}) {
  return DefaultTextStyle(
    style: universalTextStyle,
    child: InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 400,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(settingName),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 25),
              child: Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    ),
  );
}

class SettingSwitch extends StatefulWidget {
  SettingSwitch({super.key, required this.settingName, required this.val});
  bool val;
  String settingName;

  @override
  State<SettingSwitch> createState() => _SettingSwitchState();
}

class _SettingSwitchState extends State<SettingSwitch> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(widget.settingName),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: Transform.scale(
              scale: 0.9,
              child: CupertinoSwitch(
                value: widget.val,
                activeColor: Colors.pink,
                onChanged: (bool? value) {
                  setState(() {
                    widget.val = !widget.val;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TwoButtons extends StatefulWidget {
  TwoButtons(
      {super.key,
      required this.settingName,
      required this.buttonText,
      required this.buttonText2,
      required this.val});
  String settingName;
  String buttonText;
  String buttonText2;
  bool val;

  @override
  State<TwoButtons> createState() => TwoButtonsState();
}

class TwoButtonsState extends State<TwoButtons> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: universalTextStyle,
      child: SizedBox(
        width: 400,
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(widget.settingName),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () => setState(() {
                    widget.val = true;
                  }),
                  child: Container(
                    width: 100,
                    height: 30,
                    decoration: BoxDecoration(
                      color: widget.val ? Colors.pink : Colors.transparent,
                      border: Border.all(
                          color: widget.val
                              ? Colors.transparent
                              : Colors.grey.shade800),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: Text(widget.buttonText),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 25),
                  child: InkWell(
                    onTap: () => setState(() {
                      widget.val = false;
                    }),
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                        color: widget.val ? Colors.transparent : Colors.pink,
                        border: Border.all(
                          color: widget.val
                              ? Colors.grey.shade800
                              : Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      alignment: Alignment.center,
                      child: Text(widget.buttonText2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> launchUrlPage() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}

Future<void> launchUrlBug() async {
  if (!await launchUrl(_urlBug)) {
    throw Exception('Could not launch $_urlBug');
  }
}

Future<void> launchUrlFeature() async {
  if (!await launchUrl(_urlFeature)) {
    throw Exception('Could not launch $_urlFeature');
  }
}
