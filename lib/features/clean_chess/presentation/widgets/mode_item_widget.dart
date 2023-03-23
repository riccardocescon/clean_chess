import 'package:cleanchess/core/clean_chess/utilities/style.dart';
import 'package:flutter/material.dart';

class ModeItem extends StatelessWidget {
  const ModeItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    this.stats,
  });

  final String title;
  final String subtitle;
  final List<Widget>? stats;
  final Color color;
  final Widget icon;

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.maxFinite,
        height: modeItemHeigth,
        child: MaterialButton(
          padding: const EdgeInsets.all(5),
          onPressed: () {},
          child: Row(
            children: [
              _modeIcon,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _title(title),
                      _subtitle(subtitle),
                      if (stats != null) _bottomStats(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget get _modeIcon => SizedBox(
        width: 70,
        height: 80,
        child: CircleAvatar(
          backgroundColor: color,
          child: icon,
        ),
      );

  Widget _title(String title) => Expanded(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget _subtitle(String subtitle) => Expanded(
        child: Text(
          subtitle,
          style: TextStyle(
            color: Colors.white.withAlpha(60),
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  Widget _bottomStats() => Expanded(
        child: Row(
          children: stats!,
        ),
      );
}
