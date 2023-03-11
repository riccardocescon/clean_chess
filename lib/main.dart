import 'dart:developer';
import 'dart:math' as math;

import 'package:cleanchess/chess/core/utilities/navigation.dart';
import 'package:cleanchess/chess/models/puzzle.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/homepage.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/homescreen.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/login_screen.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<List<dynamic>> puzzleDb = [];

Puzzle getRandomPuzzle() {
  final randomIndex = math.Random().nextInt(puzzleDb.length);
  final puzzle = Puzzle.fromLichessDB(puzzleDb[randomIndex]);
  log("Puzzle: ${puzzle.fen}");
  return puzzle;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  const path = "assets/puzzles/lichess_db_puzzle.csv";
  log("Setting up puzzles");
  final myData = await rootBundle.loadString(path);
  log("Database loaded");
  puzzleDb.addAll(const CsvToListConverter().convert(myData));

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LichessBloc>(create: (context) => sl<LichessBloc>()),
      ],
      child: MaterialApp(
        initialRoute: Navigation.loginScreen,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case Navigation.loginScreen:
              return PageRouteBuilder(
                settings: settings,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginScreen(),
              );
            case Navigation.homescreen:
              return PageRouteBuilder(
                settings: settings,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const HomeScreen(),
              );
            case Navigation.homepage:
              return PageRouteBuilder(
                settings: settings,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const Homepage(),
              );
            default:
              return PageRouteBuilder(
                settings: settings,
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const LoginScreen(),
              );
          }
        },
        theme: ThemeData.dark(),
      ),
    ),
  );
}
