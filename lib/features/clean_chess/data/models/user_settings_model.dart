import 'package:cleanchess/core/utilities/enum_pieces.dart';
import 'package:cleanchess/core/utilities/enum_themes.dart';
import 'package:cleanchess/features/clean_chess/data/models/settings/settings.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

class UserSettingsModel {
  late DisplaySettingsModel _displaySettingsModel;

  late ClockSettingsModel _clockSettingsModel;

  late BehaviorSettingsModel _behaviorSettingsModel;

  late LanguageSettingsModel _languageSettingsModel;

  late BoardTheme _boardTheme;

  late PieceTheme _pieceTheme;

  late SoundSettingsModel _soundSettingsModel;

  late PrivacySettingsModel _privacySettingsModel;

  // Getters
  DisplaySettingsModel get displaySettingsModel => _displaySettingsModel;
  ClockSettingsModel get clockSettingsModel => _clockSettingsModel;
  BehaviorSettingsModel get behaviorSettingsModel => _behaviorSettingsModel;
  LanguageSettingsModel get languageSettingsModel => _languageSettingsModel;
  BoardTheme get boardTheme => _boardTheme;
  PieceTheme get pieceTheme => _pieceTheme;
  SoundSettingsModel get soundSettingsModel => _soundSettingsModel;
  PrivacySettingsModel get privacySettingsModel => _privacySettingsModel;

  // Setter
  set setBoardTheme(BoardTheme value) => _boardTheme = value;
  set setPieceTheme(PieceTheme value) => _pieceTheme = value;

  UserSettingsModel({
    required DisplaySettingsModel displaySettingsModel,
    required ClockSettingsModel clockSettingsModel,
    required BehaviorSettingsModel behaviorSettingsModel,
    required LanguageSettingsModel languageSettingsModel,
    required BoardTheme boardTheme,
    required PieceTheme pieceTheme,
    required SoundSettingsModel soundSettingsModel,
    required PrivacySettingsModel privacySettingsModel,
  })  : _displaySettingsModel = displaySettingsModel,
        _clockSettingsModel = clockSettingsModel,
        _behaviorSettingsModel = behaviorSettingsModel,
        _languageSettingsModel = languageSettingsModel,
        _boardTheme = boardTheme,
        _pieceTheme = pieceTheme,
        _soundSettingsModel = soundSettingsModel,
        _privacySettingsModel = privacySettingsModel;

  UserSettingsModel.fromAPI(UserPreferences prefs) {
    secure_storage_helper.getBoardTheme().then((value) {
      _boardTheme = value;
    });
    secure_storage_helper.getPieceTheme().then((value) {
      _pieceTheme = value;
    });
    _behaviorSettingsModel = BehaviorSettingsModel.fromAPI(prefs);
    _clockSettingsModel = ClockSettingsModel.fromAPI(prefs);
    _displaySettingsModel = DisplaySettingsModel.fromAPI(prefs);
    _privacySettingsModel = PrivacySettingsModel.fromAPI(prefs);
    _soundSettingsModel = SoundSettingsModel.fromAPI(prefs);
    _languageSettingsModel = LanguageSettingsModel(language: Languages.english);
  }

  void updateFromAPI(UserPreferences prefs) {
    secure_storage_helper.getBoardTheme().then((value) {
      _boardTheme = value;
    });
    secure_storage_helper.getPieceTheme().then((value) {
      _pieceTheme = value;
    });
    _behaviorSettingsModel = BehaviorSettingsModel.fromAPI(prefs);
    _clockSettingsModel = ClockSettingsModel.fromAPI(prefs);
    _displaySettingsModel = DisplaySettingsModel.fromAPI(prefs);
    _privacySettingsModel = PrivacySettingsModel.fromAPI(prefs);
    _soundSettingsModel = SoundSettingsModel.fromAPI(prefs);
  }

  UserSettingsModel.none() {
    _displaySettingsModel = DisplaySettingsModel.none();
    _clockSettingsModel = ClockSettingsModel.none();
    _behaviorSettingsModel = BehaviorSettingsModel.none();
    _boardTheme = BoardTheme.blue;
    _pieceTheme = PieceTheme.alpha;
    _languageSettingsModel = LanguageSettingsModel(language: Languages.english);
    _soundSettingsModel = SoundSettingsModel.none();
    _privacySettingsModel = PrivacySettingsModel.none();
  }

  UserSettingsModel.test() {
    _displaySettingsModel = DisplaySettingsModel(
      pieceTheme: PieceTheme.alpha,
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
