import 'package:flutter/material.dart';

class ModeItem extends StatelessWidget {
  const ModeItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.stats,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final List<Widget>? stats;
  final Color color;
  final Widget icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: _modeIcon,
      title: _title(title),
      subtitle: _subtitle(subtitle),
      // if (stats != null) _bottomStats(),
    );
  }

  Widget get _modeIcon => SizedBox(
        width: kToolbarHeight,
        height: kToolbarHeight,
        child: CircleAvatar(
          backgroundColor: color,
          child: icon,
        ),
      );

  Widget _title(String title) => Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      );

  Widget _subtitle(String subtitle) => Text(
        subtitle,
        style: TextStyle(
          color: Colors.white.withAlpha(60),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      );

  Widget _bottomStats() => Expanded(
        child: Row(
          children: stats!,
        ),
      );
}
