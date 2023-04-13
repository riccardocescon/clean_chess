import 'package:cleanchess/features/clean_chess/presentation/widgets/titled_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PuzzlePage extends StatelessWidget {
  const PuzzlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body: _body(), title: 'Puzzle');
  }

  Widget _body() {
    return Container();
  }
}
