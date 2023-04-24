import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.timerController, this.textStyle});

  final TimerController timerController;
  final TextStyle? textStyle;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  void initState() {
    widget.timerController.addListener(_handleTimer);
    super.initState();
  }

  void _handleTimer() {
    setState(() {});
  }

  @override
  void dispose() {
    widget.timerController.removeListener(_handleTimer);
    super.dispose();
  }

  String get _formattedTime {
    final int minutes = widget.timerController._seconds ~/ 60;
    final int seconds = widget.timerController._seconds % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedTime,
      style: widget.textStyle,
    );
  }
}

class TimerController extends ChangeNotifier {
  late Timer _timer;

  int _seconds = 0;

  TimerController({Duration duration = const Duration(seconds: 1)}) {
    _timer = Timer.periodic(duration, (timer) {});
  }

  void restart({Duration duration = const Duration(seconds: 1)}) {
    _seconds = 0;
    _timer.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _seconds++;
      notifyListeners();
    });
  }

  void stop() {
    _seconds = 0;
    _timer.cancel();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
