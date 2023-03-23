import 'package:flutter/material.dart';

class PaddedItems extends StatelessWidget {
  const PaddedItems({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: children,
        ),
      );
}
