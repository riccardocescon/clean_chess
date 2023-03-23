import 'dart:developer';

import 'package:cleanchess/core/errors/failure.dart';
import 'package:flutter/material.dart';

/// Shows an error message
void showSnackbarError(
  BuildContext context,
  Failure failure, {
  Duration duration = const Duration(seconds: 2),
}) {
  log(failure.message);
  showSnackbar(
    context: context,
    message: failure.message,
    backgroundColor: Colors.red,
    duration: duration,
  );
}

showSnackbarSuccess(
  BuildContext context,
  String message, {
  Duration duration = const Duration(milliseconds: 500),
}) {
  showSnackbar(
    context: context,
    message: message,
    backgroundColor: Colors.green,
    duration: duration,
  );
}

void showSnackbar({
  required BuildContext context,
  required String message,
  Color backgroundColor = Colors.white,
  Duration duration = const Duration(milliseconds: 500),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
    ),
  );
}
