import 'package:cleanchess/features/clean_chess/presentation/widgets/settings/settings_pick_board_theme_page.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/settings_screen_pages.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
      appBar: _appbar(context),
    );
  }
}

AppBar _appbar(BuildContext context) {
  return AppBar(
    title: DefaultTextStyle(
      style: universalTextStyle,
      child: Text(
        'Settings',
        style: TextStyle(
          fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
        ),
      ),
    ),
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios)),
  );
}

Widget _body(BuildContext context) {
  return Column(
    children: [
      _settingButton(
        settingName: "Display",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Display())),
        settingIcon: Icons.display_settings,
      ),
      _settingButton(
        settingName: "Clock",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Clock())),
        settingIcon: Icons.access_time_outlined,
      ),
      _settingButton(
        settingName: "Behavior",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Behavior())),
        settingIcon: Icons.settings_applications,
      ),
      _settingButton(
        settingName: "Language",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Language())),
        settingIcon: Icons.language,
      ),
      _settingButton(
        settingName: "Theme",
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SettingsPickBoardThemePage(),
          ),
        ),
        settingIcon: Icons.color_lens,
      ),
      _settingButton(
        settingName: "Sound",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Sound())),
        settingIcon: Icons.volume_up,
      ),
      _settingButton(
        settingName: "Privacy",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Privacy())),
        settingIcon: Icons.privacy_tip,
      ),
      _settingButton(
        settingName: "Contribute",
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Contribute())),
        settingIcon: Icons.code,
      ),
    ],
  );
}

Widget _settingButton({
  required String settingName,
  required void Function() onTap,
  required IconData settingIcon,
}) {
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
