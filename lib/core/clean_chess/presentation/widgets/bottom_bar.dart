import 'package:flutter/material.dart';

class BottomButton {
  IconData iconButton;
  void Function() onPressed;
  Color? color;

  BottomButton({
    required this.iconButton,
    required this.onPressed,
    this.color,
  });
}

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.buttons,
  });

  final List<BottomButton> buttons;

  @override
  Widget build(BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.grey.shade900,
        height: 80,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: buttons
                .map(
                  (e) => IconButton(
                    onPressed: e.onPressed,
                    icon: Icon(
                      e.iconButton,
                      color: e.color ?? Colors.white,
                    ),
                  ),
                )
                .toList()),
      );
}
