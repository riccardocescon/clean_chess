import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  const BaseScaffold({
    super.key,
    required this.body,
    required this.title,
    this.subtitle,
    this.bottomNavigationBar,
    this.onPop,
  });

  final Widget body;
  final String title;
  final String? subtitle;
  final BottomNavigationBar? bottomNavigationBar;
  final Future<void> Function()? onPop;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
                    color: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .color
                        ?.withOpacity(0.4),
                  ),
                ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () async {
              await onPop?.call();
              if (context.mounted) Navigator.of(context).pop();
            },
            iconSize: Theme.of(context).textTheme.titleLarge!.fontSize,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
        body: body,
      ),
    );
  }
}
