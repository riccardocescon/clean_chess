import 'package:cleanchess/chess/core/utilities/navigation.dart';
import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:cleanchess/core/presentation/widgets/scale_animated_logo.dart';
import 'package:cleanchess/core/presentation/widgets/scale_animated_widget.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/lichess_state.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/login_screen_chessboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const ScaleAnimatedWidet(
            child: Text(
              'Clean Chess',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: _listener(child: _body(context)),
      ),
    );
  }

  Widget _body(context) => SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ScaleAnimatedLogo(size: 150),
            SizedBox(
              width: 200,
              height: 60,
              child: MaterialButton(
                onPressed: () => BlocProvider.of<LichessBloc>(context).add(
                  const LichessOAuthEvent(),
                ),
                color: Colors.teal.shade300,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _animatedBody(context) {
    return SizedBox(
      width: double.maxFinite,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 100,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const ScaleAnimatedLogo(size: 150),
            Column(
              children: [
                LoginScreenChessboard(
                  onOAuthStart: () => BlocProvider.of<LichessBloc>(context).add(
                    const LichessOAuthEvent(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _listener({required Widget child}) =>
      BlocListener<LichessBloc, LichessState>(
        listener: (context, state) {
          if (state is LichessOAuthSuccess) {
            showSnackbarSuccess(context, 'Logged in');
            Navigator.pushReplacementNamed(context, Navigation.homescreen);
          } else if (state is LichessError) {
            showSnackbarError(context, state.failure);
          }
        },
        child: child,
      );
}
