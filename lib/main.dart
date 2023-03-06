import 'dart:developer';
import 'dart:math' as math;

import 'package:cleanchess/chess/core/utilities/navigation.dart';
import 'package:cleanchess/chess/models/puzzle.dart';
import 'package:cleanchess/features/cleanchess/presentation/pages/homepage.dart';
import 'package:cleanchess/features/cleanchess/presentation/pages/homescreen.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final List<List<dynamic>> puzzleDb = [];

Puzzle getRandomPuzzle() {
  final randomIndex = math.Random().nextInt(puzzleDb.length);
  final puzzle = Puzzle.fromLichessDB(puzzleDb[randomIndex]);
  log("Puzzle: ${puzzle.fen}");
  return puzzle;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const path = "assets/puzzles/lichess_db_puzzle.csv";
  log("Setting up puzzles");
  final myData = await rootBundle.loadString(path);
  log("Database loaded");
  puzzleDb.addAll(const CsvToListConverter().convert(myData));

  runApp(
    MaterialApp(
      initialRoute: Navigation.homescreen,
      routes: {
        Navigation.homescreen: (context) => const HomeScreen(),
        Navigation.homepage: (context) => const Homepage(),
      },
      theme: ThemeData.dark(),
    ),
  );
}
