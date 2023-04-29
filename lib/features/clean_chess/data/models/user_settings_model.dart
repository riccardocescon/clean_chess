import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/features/clean_chess/data/models/settings/settings.dart';
import 'package:cleanchess/features/clean_chess/presentation/blocs/account_cubit.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:cleanchess/injection_container.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class UserSettingsModel {
  late final DisplaySettingsModel _displaySettingsModel;

  late final ClockSettingsModel _clockSettingsModel;

  late final BehaviorSettingsModel _behaviorSettingsModel;

  late final LanguageSettingsModel _languageSettingsModel;

  late BoardTheme _boardTheme;

  late final SoundSettingsModel _soundSettingsModel;

  late final PrivacySettingsModel _privacySettingsModel;

  // Getters
  DisplaySettingsModel get displaySettingsModel => _displaySettingsModel;
  ClockSettingsModel get clockSettingsModel => _clockSettingsModel;
  BehaviorSettingsModel get behaviorSettingsModel => _behaviorSettingsModel;
  LanguageSettingsModel get languageSettingsModel => _languageSettingsModel;
  BoardTheme get boardTheme => _boardTheme;
  SoundSettingsModel get soundSettingsModel => _soundSettingsModel;
  PrivacySettingsModel get privacySettingsModel => _privacySettingsModel;

  UserSettingsModel({
    required DisplaySettingsModel displaySettingsModel,
    required ClockSettingsModel clockSettingsModel,
    required BehaviorSettingsModel behaviorSettingsModel,
    required LanguageSettingsModel languageSettingsModel,
    required BoardTheme boardTheme,
    required SoundSettingsModel soundSettingsModel,
    required PrivacySettingsModel privacySettingsModel,
  })  : _displaySettingsModel = displaySettingsModel,
        _clockSettingsModel = clockSettingsModel,
        _behaviorSettingsModel = behaviorSettingsModel,
        _languageSettingsModel = languageSettingsModel,
        _boardTheme = boardTheme,
        _soundSettingsModel = soundSettingsModel,
        _privacySettingsModel = privacySettingsModel;

  UserSettingsModel.fromAPI(UserPreferences prefs) {}

  UserSettingsModel.test() {
    _displaySettingsModel = DisplaySettingsModel(
      pieceAnimation: PieceAnimation.none,
      magnifiedDraggedPieces: true,
      boardHighlights: true,
      moveListWhilePlaying: true,
      pieceDestinations: true,
      boardCoordinates: true,
      moveNotation: MoveNotation.letters,
      zenMode: true,
      blindfoldChess: true,
      boardScreenSide: BoardScreenSide.left,
      boardOrientation: BoardOrientation.whiteOnBottom,
    );
    _clockSettingsModel = ClockSettingsModel(
      clockPosition: ClockPosition.bottom,
      tenthsOfSeconds: TenthsOfSeconds.on,
      progressbar: true,
      soundWhenTimeGetsCritical: true,
      giveMoreTime: GiveMoreTime.on,
    );
    _behaviorSettingsModel = BehaviorSettingsModel(
      moveType: MoveType.drag,
      premove: true,
      takebacks: Takebacks.always,
      promoteToQueen: PromoteToQueen.whenPremove,
      drawOnThreefoldRepetition: DrawOnThreefoldRepetition.always,
      confirmResignation: true,
      castlingMode: CastlingMode.either,
      keyboardInput: true,
      snapArrows: true,
      goodGameAfterDefeat: true,
    );
    _boardTheme = BoardTheme.blue;
    _languageSettingsModel = LanguageSettingsModel(language: Languages.english);
    _soundSettingsModel = SoundSettingsModel(
      notifications: true,
      sound: true,
      vibrate: true,
    );
    _privacySettingsModel = PrivacySettingsModel(
      challenge: Challenge.rating,
      chessInsights: ChessInsights.noone,
      follow: true,
      message: Message.always,
      study: Study.always,
    );
  }
}
