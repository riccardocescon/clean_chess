import 'package:clean_chess/core/utilities/navigation.dart';
import 'package:clean_chess/features/clean_chess/data/models/board.dart';
import 'package:clean_chess/features/clean_chess/presentation/bloc/board_bloc.dart';
import 'package:clean_chess/features/clean_chess/presentation/pages/homepage.dart';
import 'package:clean_chess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(
    MaterialApp(
      initialRoute: Navigation.homepage,
      routes: {
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
