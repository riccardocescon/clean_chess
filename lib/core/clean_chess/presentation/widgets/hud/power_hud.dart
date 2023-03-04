import 'package:flutter/material.dart';

class PowerHud extends StatelessWidget {
  const PowerHud({
    super.key,
    required this.whitePower,
    required this.blackPower,
  });

  final String whitePower;
  final String blackPower;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: Column(
          children: [
            Text(
              whitePower,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            Text(
              blackPower,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
}
