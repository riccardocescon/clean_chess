import 'dart:developer';

import 'package:clean_chess/chess/core/utilities/navigation.dart';
import 'package:clean_chess/features/clean_chess/presentation/pages/new_homepage.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List<List<dynamic>> puzzleDb = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const path = "assets/puzzles/lichess_db_puzzle.csv";
  log("Setting up puzzles");
  final myData = await rootBundle.loadString(path);
  log("Database loaded");
  puzzleDb.addAll(const CsvToListConverter().convert(myData));

  runApp(
    MaterialApp(
      initialRoute: Navigation.homepage,
      routes: {
        Navigation.homepage: (context) => const Homepage(),
      },
      theme: ThemeData.dark(),
    ),
  );
}
