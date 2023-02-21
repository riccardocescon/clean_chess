import 'package:clean_chess/core/utilities/navigation.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_bloc.dart';
import 'package:clean_chess/features/clean_chess/presentation/pages/homepage.dart';
import 'package:clean_chess/features/clean_chess/presentation/pages/new_homepage.dart';
import 'package:clean_chess/injection_container.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final List<List<dynamic>> puzzleDb = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  const path = "assets/puzzles/lichess_db_puzzle.csv";
  print("Setting up puzzles");
  final myData = await rootBundle.loadString(path);
  print("Database loaded");
  puzzleDb.addAll(const CsvToListConverter().convert(myData));

  runApp(
    MaterialApp(
      initialRoute: Navigation.newHomepage,
      // initialRoute: Navigation.homepage,
      routes: {
        Navigation.newHomepage: (context) => const NewHomepage(),
        Navigation.homepage: (context) => BlocProvider(
              create: (context) => sl<BoardBloc>(),
              child: Homepage(
                board: sl<Board>(),
              ),
            ),
      },
      theme: ThemeData.dark(),
    ),
  );
}
