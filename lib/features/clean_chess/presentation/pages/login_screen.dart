import 'package:cleanchess/chess/core/utilities/navigation.dart';
import 'package:cleanchess/core/clean_chess/utilities/snackbar.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/event/event.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_state.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/auth_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_lined_board.dart';
import 'package:cleanchess/injection_container.dart';
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
      body: _buildServerBlocListener(
        child: _buildScaffoldBody(),
      ),
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

  Widget _buildServerBlocListener({required Widget child}) =>
      BlocListener<ServerBloc, ServerState>(
        listener: (context, state) {
          if (state is LichessOAuthSuccess) {
            // Get user profile
            if (context.mounted) {
              Navigator.pushReplacementNamed(context, Navigation.homepage);
            }
          } else if (state is LichessError) {
            if (context.mounted) {
              showSnackbarError(context, state.failure);
            }
          }
        },
        child: child,
      );
}
