import 'package:cleanchess/features/clean_chess/presentation/widgets/setting_widgets.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/settings_screen_pages.dart';
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
      //       .push(MaterialPageRoute(builder: (context) => const Display())),
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
