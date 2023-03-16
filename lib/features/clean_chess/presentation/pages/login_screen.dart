import 'package:cleanchess/chess/core/utilities/navigation.dart';
import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/event/event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_state.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_lined_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final _buttonSize = Size(MediaQuery.of(context).size.width * 0.7, 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: _listener(child: _body()),
    );
  }

  Widget _body() => SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnimatedLinedBoard(),
            const SizedBox(height: 60),
            _lichessLoginButton(),
            _continueAsGuestButton(),
          ],
        ),
      );

  Widget _lichessLoginButton() => SizedBox(
        width: _buttonSize.width,
        height: _buttonSize.height,
        child: MaterialButton(
          onPressed: () => BlocProvider.of<ServerBloc>(context).add(
            const LichessOAuthEvent(),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/lichess_logo.png',
                color: Colors.black,
                width: 30,
              ),
              const SizedBox(width: 20),
              const Text(
                'Login with Lichess',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _continueAsGuestButton() => GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: _buttonSize.width,
          height: _buttonSize.height,
          child: Center(
            child: Text(
              'Continue as guest',
              style: TextStyle(
                color: Colors.white.withAlpha(170),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );

  Widget _listener({required Widget child}) =>
      BlocListener<ServerBloc, ServerState>(
        listener: (context, state) {
          if (state is LichessOAuthSuccess) {
            // Get user profile
            Navigator.pushNamed(context, Navigation.homescreen);
          } else if (state is LichessError) {
            showSnackbarError(context, state.failure);
          }
        },
        child: child,
      );
}
