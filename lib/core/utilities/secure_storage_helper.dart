import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// Timed Access Token
const String _timedAccessToken = 'timed_access_token';
Future saveTimedAccessToken(String accessToken) async =>
    const FlutterSecureStorage()
        .write(key: _timedAccessToken, value: accessToken);

Future<String?> getTimedAccessToken() async =>
    const FlutterSecureStorage().read(key: _timedAccessToken);

Future<void> deleteTimedAccessToken() async =>
    const FlutterSecureStorage().delete(key: _timedAccessToken);

// Animation Type
const String _animationType = 'animation_type';
Future saveAnimationType(int animationType) async =>
    const FlutterSecureStorage()
        .write(key: _animationType, value: animationType.toString());

Future<PieceAnimation> getAnimationType() async {
  int id = int.parse(
    await const FlutterSecureStorage().read(key: _animationType) ??
        PieceAnimation.none.id.toString(),
  );
  return PieceAnimation.values.firstWhere((element) => element.id == id);
}

Future<void> deleteAnimationType() async =>
    const FlutterSecureStorage().delete(key: _animationType);

// Board Theme
const String _boardTheme = 'board_theme';
Future saveBoardTheme(BoardTheme boardTheme) async =>
    const FlutterSecureStorage()
        .write(key: _boardTheme, value: boardTheme.name);

Future<BoardTheme> getBoardTheme() async {
  String name = await const FlutterSecureStorage().read(key: _boardTheme) ??
      BoardTheme.blue.name;
  return BoardTheme.values.firstWhere((element) => element.name == name);
}

Future<void> deleteBoardTheme() async =>
    const FlutterSecureStorage().delete(key: _boardTheme);
