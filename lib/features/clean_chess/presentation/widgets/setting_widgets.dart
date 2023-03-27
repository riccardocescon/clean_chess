import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// S = switcher
// P = custom Page
// D = Dropdown

//  Board highlights S
bool boardHighlightsValue = false;
// Piece destinations S
bool pieceDestinationsValue = false;
// Board coordinates S
bool boardCoordinatesValue = false;
// Move list while playing S
bool moveListWhilePlayingValue = false;
// Move notation D //TODO
bool moveNotationValue = false;
// Zen mode S
bool zenModeValue = false;

// Clock position D //TODO
bool clockPositionValue = false;
// Tenths of seconds D //TODO
bool tenthsOfSecondsValue = false;
// Sound when time gets critical S
bool criticalTimeSoundValue = false;
// Give more time S
bool give15secondsValue = false;

// Notifications S
bool notificationsValue = false;
// Vibrate on game events S
bool vibrateOnGameEventsValue = false;
// Toggle sound S
bool toggleSoundValue = false;

final Uri _url = Uri.parse('https://github.com/riccardocescon/clean_chess');
final Uri _urlBug = Uri.parse(
    'https://github.com/riccardocescon/clean_chess/issues/new?assignees=&labels=&template=bug_report.md&title=');
final Uri _urlFeature = Uri.parse(
    'https://github.com/riccardocescon/clean_chess/issues/new?assignees=&labels=&template=feature_request.md&title=');

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

TextStyle universalTextStyle = const TextStyle(
  color: Colors.white,
);

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

Widget settingSwitch({
  //TODO create a switch widget
  required String settingName,
  required bool value,
}) {
  return DefaultTextStyle(
    style: universalTextStyle,
    child: SizedBox(
      width: 400,
      height: 50,
      child: Row(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(settingName),
              ),
            ],
          ),
        ],
      ),
    ),
  );
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
