import 'dart:async';
import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/auth_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_lined_board.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size get _buttonSize => Size(MediaQuery.of(context).size.width * 0.7, 50);

  late StreamSubscription<AuthState> _authCubitListener;

  @override
  void initState() {
    super.initState();
    _authCubitListener = sl<AuthCubit>().stream.listen((state) {
      state.maybeMap(
        failure: (state) => showSnackbarSuccess(context, state.error.message),
        orElse: () {},
      );
    });
  }

  @override
  void dispose() {
    _authCubitListener.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScaffoldBody(),
    );
  }

  Widget _buildScaffoldBody() => SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AnimatedLinedBoard(),
            const SizedBox(height: 60),
            _lichessLoginButton(),
            _buildContinueAsGuestButton(),
          ],
        ),
      );

  Widget _lichessLoginButton() => SizedBox(
        width: _buttonSize.width,
        height: _buttonSize.height,
        child: ElevatedButton.icon(
          onPressed: () {
            sl<AuthCubit>().login();
          },
          icon: Image.asset(
            'assets/img/lichess_logo.png',
            color: Colors.black,
            width: 30,
          ),
          label: const Text('Login with Lichess'),
        ),
      );

  Widget _buildContinueAsGuestButton() => GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: _buttonSize.width,
          height: _buttonSize.height,
          child: const Center(
            child: Text(
              'Continue as guest',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
}
