import 'package:cleanchess/features/clean_chess/data/models/settings/language_settings_model.dart';
import 'package:cleanchess/features/clean_chess/data/models/settings/settings.dart';

class UserSettingsModel {
  late final DisplaySettingsModel _displaySettingsModel;

  late final ClockSettingsModel _clockSettingsModel;

  late final BehaviorSettingsModel _behaviorSettingsModel;

  late final LanguageSettingsModel _languageSettingsModel;

  //TODO: themes

  late final SoundSettingsModel _soundSettingsModel;

  late final PrivacySettingsModel _privacySettingsModel;

  // Getters
  DisplaySettingsModel get displaySettingsModel => _displaySettingsModel;
  ClockSettingsModel get clockSettingsModel => _clockSettingsModel;
  BehaviorSettingsModel get behaviorSettingsModel => _behaviorSettingsModel;
  LanguageSettingsModel get languageSettingsModel => _languageSettingsModel;
  SoundSettingsModel get soundSettingsModel => _soundSettingsModel;
  PrivacySettingsModel get privacySettingsModel => _privacySettingsModel;

  UserSettingsModel({
    required DisplaySettingsModel displaySettingsModel,
    required ClockSettingsModel clockSettingsModel,
    required BehaviorSettingsModel behaviorSettingsModel,
    required LanguageSettingsModel languageSettingsModel,
    required SoundSettingsModel soundSettingsModel,
    required PrivacySettingsModel privacySettingsModel,
  })  : _displaySettingsModel = displaySettingsModel,
        _clockSettingsModel = clockSettingsModel,
        _behaviorSettingsModel = behaviorSettingsModel,
        _languageSettingsModel = languageSettingsModel,
        _soundSettingsModel = soundSettingsModel,
        _privacySettingsModel = privacySettingsModel;

  UserSettingsModel.test() {
    _displaySettingsModel = DisplaySettingsModel(
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
      clockPosition: 1,
      tenthsOfSeconds: 1,
      progressbar: true,
      soundWhenTimeGetsCritical: true,
      giveMoreTime: 1,
    );
    _behaviorSettingsModel = BehaviorSettingsModel(
      moveType: 1,
      premove: true,
      takebacks: 1,
      promoteToQueen: 1,
      drawOnThreefoldRepetition: 1,
      confirmResignation: true,
      castlingMode: 1,
      keyboardInput: true,
      snapArrows: true,
      goodGameAfterDefeat: true,
    );
    _languageSettingsModel = LanguageSettingsModel(language: Languages.english);
    _soundSettingsModel = SoundSettingsModel(
      notifications: true,
      sound: true,
      vibrate: true,
    );
    _privacySettingsModel = PrivacySettingsModel(
      challenge: 1,
      chessInsights: 1,
      follow: true,
      message: 1,
      study: 1,
    );
  }
}
