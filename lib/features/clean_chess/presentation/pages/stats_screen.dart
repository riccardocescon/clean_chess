import 'package:flutter/material.dart';

const backgroundColor = Color.fromARGB(225, 17, 17, 17);

@override
class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: _appbar(context),
        body: _body(),
      ),
    );
  }

  AppBar _appbar(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      shadowColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}

Widget _body() {
  return ListView();
}
