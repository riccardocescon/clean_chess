import 'package:flutter/material.dart';

class HudSwitcher extends StatelessWidget {
  const HudSwitcher({
    super.key,
    required this.title,
    required this.onChange,
    required this.value,
  });

  final String title;
  final void Function(bool) onChange;
  final bool value;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16)),
                const SizedBox(width: 10),
                Switch(value: value, onChanged: onChange),
              ],
            ),
          ],
        ),
      );
}
