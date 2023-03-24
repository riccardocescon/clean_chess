import 'dart:developer';

import 'package:cleanchess/core/chesskit/chesskit_failures.dart';
import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:flutter/material.dart';

/// Shows an error message
void showChesskitSnackbarError(
  BuildContext context,
  ChesskitFailure failure, {
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
