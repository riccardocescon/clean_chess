import 'package:cleanchess/chess/core/utilities/navigation.dart';
import 'package:cleanchess/core/utilities/mixins/access_token_provider.dart';
import 'package:cleanchess/features/clean_chess/presentation/bloc/server_bloc.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/auth_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/homepage.dart';
import 'package:cleanchess/features/clean_chess/presentation/pages/login_screen.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shared_tools/flutter_shared_tools.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();

  runApp(const Root());
}

class Root extends StatefulWidget {
  const Root({
    super.key,
  });

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = createDefaultThemeData();

    return GlobalProvider(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: theme.scaffoldBackgroundColor,
          systemNavigationBarColor: theme.scaffoldBackgroundColor,
        ),
        child: BlocBuilder<AuthCubit, AuthState>(
          bloc: sl<AuthCubit>(),
          builder: (context, state) {
            return MaterialApp(
              key: UniqueKey(),
              theme: theme,
              debugShowCheckedModeBanner: false,
              initialRoute: Navigation.homepage,
              onGenerateRoute: (settings) {
                if (state.status == AuthStatus.notLogged) {
                  return PageRouteBuilder(
                    settings: settings,
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const LoginScreen(),
                  );
                }

                switch (settings.name) {
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
            );
          },
        ),
      ),
    );
  }
}

class GlobalProvider extends StatefulWidget {
  const GlobalProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<GlobalProvider> createState() => _GlobalProviderState();
}

class _GlobalProviderState extends State<GlobalProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ServerBloc>(create: (context) => sl<ServerBloc>()),
      ],
      child: widget.child,
    );
  }
}

ThemeData createDefaultThemeData() {
  // TODO: Implement light and HUE based theme data functions.
  return _createDarkThemeData();
}

ThemeData _createDarkThemeData() {
  const Color kBackgroundColor = Color(0xff111111);
  const Color kCardColor = kBackgroundColor;
  const Color kCanvasColor = Color(0xff121212);
  const Color kPrimaryColor = Color(0xFFFFFFFF);
  const Color kSecondaryColor = Colors.white;

  return createThemeData(
    canvasColor: kCanvasColor,
    backgroundColor: kBackgroundColor,
    cardColor: kCardColor,
    primaryColor: kPrimaryColor,
    secondaryColor: kSecondaryColor,
    textColor: Colors.white70,
    headlineColor: Colors.white,
    disabledColor: const Color.fromARGB(255, 78, 78, 78),
    base: ThemeData.dark(),
    fontFamily: AppFont.montserrat,
  );
}

enum AppFont {
  montserrat('Montserrat'),
  robotoMono('Roboto Mono');

  const AppFont(this.pubspecAssetKey);

  final String pubspecAssetKey;
}

extension BrightnessInverse on Brightness {
  Brightness get inverse =>
      this == Brightness.dark ? Brightness.light : Brightness.dark;
}

ThemeData createThemeData({
  required AppFont fontFamily,
  required Color backgroundColor,
  required Color cardColor,
  required Color canvasColor,
  required ThemeData base,
  required Color secondaryColor,
  required Color primaryColor,
  required Color textColor,
  required Color disabledColor,
  required Color headlineColor,
}) {
  final String fontFamilyName = fontFamily.pubspecAssetKey;

  final TextTheme textTheme =
      base.textTheme.merge(Typography.material2021().black).apply(
            fontFamily: fontFamilyName,
            bodyColor: textColor,
          );

  base = base.copyWith(
    splashColor: primaryColor.withOpacity(0.025),
    highlightColor: primaryColor.withOpacity(0.025),
  );

  final OutlinedBorder defaultButtonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );

  return base.copyWith(
    bottomAppBarTheme: base.bottomAppBarTheme.copyWith(
      elevation: 0,
      color: backgroundColor,
      surfaceTintColor: Colors.transparent,
    ),
    textButtonTheme: TextButtonThemeData(
      style: (base.textButtonTheme.style ?? const ButtonStyle()).copyWith(
        foregroundColor:
            MaterialStateProperty.resolveWith<Color?>((_) => textColor),
        surfaceTintColor: MaterialStateProperty.resolveWith<Color?>(
          (_) => Colors.transparent,
        ),
        shape: MaterialStatePropertyAll<OutlinedBorder>(defaultButtonShape),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.isNotEmpty) {
              return canvasColor;
            }
            return null;
          },
        ),
      ),
    ),
    scaffoldBackgroundColor: backgroundColor,
    disabledColor: disabledColor,
    textTheme: textTheme,
    primaryColor: primaryColor,
    dividerColor: disabledColor.withOpacity(.1),
    appBarTheme: base.appBarTheme.copyWith(
      surfaceTintColor: Colors.transparent,
      backgroundColor: cardColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle:
          (base.appBarTheme.titleTextStyle ?? textTheme.displayLarge)!
              .copyWith(color: textColor, fontSize: k8dp),
      iconTheme: (base.appBarTheme.iconTheme ?? const IconThemeData.fallback())
          .copyWith(
        color: textColor,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: base.brightness.inverse,
        statusBarColor: Colors.transparent,
      ),
    ),
    listTileTheme: base.listTileTheme.copyWith(
      iconColor: textColor.withOpacity(0.5),
      textColor: textColor,
    ),
    radioTheme: base.radioTheme.copyWith(
      fillColor: MaterialStateProperty.all(primaryColor),
    ),
    dialogTheme: base.dialogTheme.copyWith(
      surfaceTintColor: Colors.transparent,
    ),
    navigationBarTheme: base.navigationBarTheme.copyWith(
      backgroundColor: backgroundColor,
      elevation: 0,
      height: kToolbarHeight * 1.3,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      indicatorColor: primaryColor,
      labelTextStyle: MaterialStateProperty.resolveWith<TextStyle?>(
        (Set<MaterialState> states) {
          return textTheme.labelLarge!.copyWith(color: primaryColor);
        },
      ),
      iconTheme: MaterialStateProperty.resolveWith<IconThemeData?>(
        (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return base.iconTheme.copyWith(color: backgroundColor);
          }
          return base.iconTheme.copyWith(color: primaryColor);
        },
      ),
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.isNotEmpty) {
              return backgroundColor.withOpacity(.05);
            }
            return null;
          },
        ),
        shape: MaterialStatePropertyAll<OutlinedBorder>(defaultButtonShape),
        foregroundColor: MaterialStatePropertyAll(backgroundColor),
        backgroundColor: MaterialStatePropertyAll(primaryColor),
        textStyle: MaterialStateProperty.resolveWith<TextStyle?>(
          (states) {
            return textTheme.bodyLarge!.copyWith(color: backgroundColor);
          },
        ),
      ),
    ),
    dialogBackgroundColor: backgroundColor,
    canvasColor: canvasColor,
    cardColor: cardColor,
    tooltipTheme: base.tooltipTheme.copyWith(
      textStyle: TextStyle(color: backgroundColor),
      decoration: BoxDecoration(
        color: textColor,
        borderRadius: BorderRadius.circular(k1dp),
      ),
    ),
    colorScheme: base.colorScheme.copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
      background: backgroundColor,
      outline: disabledColor,
    ),
    useMaterial3: true,
  );
}
