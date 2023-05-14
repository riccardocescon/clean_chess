import 'package:cleanchess/core/utilities/enum_pieces.dart';
import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:cleanchess/features/clean_chess/presentation/widgets/animated_board_piece.dart';
import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';
import 'package:cleanchess/core/utilities/secure_storage_helper.dart'
    as secure_storage_helper;

class DisplaySettingsModel {
  PieceTheme? _pieceTheme;
  PieceAnimation? _pieceAnimation;
  _MagnifiedDraggedPiece? _magnifiedDraggedPieces;
  _BoardHighlights? _boardHighlights;
  _MoveListWhilePlaying? _moveListWhilePlaying;
  _PieceDestinations? _pieceDestinations;
  _BoardCoordinates? _boardCoordinates;
  _MoveNotation? _moveNotation;
  _ZenMode? _zenMode;
  _BlindfoldChess? _blindfoldChess;
  _BoardScreenSide? _boardScreenSide;
  _BoardOrientation? _boardOrientation;

  // Getters
  PieceTheme? get pieceTheme => _pieceTheme;
  PieceAnimation? get pieceAnimation => _pieceAnimation;
  SwitchSetting? get magnifiedDraggedPieces => _magnifiedDraggedPieces;
  SwitchSetting? get boardHighlights => _boardHighlights;
  SwitchSetting? get moveListWhilePlaying => _moveListWhilePlaying;
  SwitchSetting? get pieceDestinations => _pieceDestinations;
  SwitchSetting? get boardCoordinates => _boardCoordinates;
  ButtonsSetting? get moveNotation => _moveNotation;
  SwitchSetting? get zenMode => _zenMode;
  SwitchSetting? get blindfoldChess => _blindfoldChess;
  ButtonsSetting? get boardScreenSide => _boardScreenSide;
  ButtonsSetting? get boardOrientation => _boardOrientation;

  List<dynamic> get values => [
        if (pieceAnimation != null) pieceAnimation,
        if (magnifiedDraggedPieces != null) magnifiedDraggedPieces,
        if (boardHighlights != null) boardHighlights,
        if (moveListWhilePlaying != null) moveListWhilePlaying,
        if (pieceDestinations != null) pieceDestinations,
        if (boardCoordinates != null) boardCoordinates,
        if (moveNotation != null) moveNotation,
        if (zenMode != null) zenMode,
        if (blindfoldChess != null) blindfoldChess,
        if (boardScreenSide != null) boardScreenSide,
        if (boardOrientation != null) boardOrientation,
      ];

  // Setters
  set setPieceTheme(PieceTheme value) => _pieceTheme = value;
  set setPieceAnimation(PieceAnimation value) => _pieceAnimation = value;
  set setMagnifiedDraggedPieces(bool value) =>
      _magnifiedDraggedPieces?.value = value;
  set setBoardHighlights(bool value) => _boardHighlights?.value = value;
  set setMoveListWhilePlaying(bool value) =>
      _moveListWhilePlaying?.value = value;
  set setPieceDestinations(bool value) => _pieceDestinations?.value = value;
  set setBoardCoordinates(bool value) => _boardCoordinates?.value = value;
  set setMoveNotation(MoveNotation value) =>
      _moveNotation?.setValueByReference = value;
  set setZenMode(bool value) => _zenMode?.value = value;
  set setBlindfoldChess(bool value) => _blindfoldChess?.value = value;
  set setBoardScreenSide(BoardScreenSide value) =>
      _boardScreenSide?.setValueByReference = value;
  set setBoardOrientation(BoardOrientation value) =>
      _boardOrientation?.setValueByReference = value;

  DisplaySettingsModel({
    required PieceTheme pieceTheme,
    required PieceAnimation pieceAnimation,
    required bool magnifiedDraggedPieces,
    required bool boardHighlights,
    required bool moveListWhilePlaying,
    required bool pieceDestinations,
    required bool boardCoordinates,
    required MoveNotation moveNotation,
    required bool zenMode,
    required bool blindfoldChess,
    required BoardScreenSide boardScreenSide,
    required BoardOrientation boardOrientation,
  }) {
    _pieceTheme = pieceTheme;
    _pieceAnimation = pieceAnimation;
    _magnifiedDraggedPieces =
        _MagnifiedDraggedPiece(value: magnifiedDraggedPieces);

    _boardHighlights = _BoardHighlights(value: boardHighlights);
    _moveListWhilePlaying = _MoveListWhilePlaying(value: moveListWhilePlaying);
    _pieceDestinations = _PieceDestinations(value: pieceDestinations);
    _boardCoordinates = _BoardCoordinates(value: boardCoordinates);
    _moveNotation = _MoveNotation(value: moveNotation);
    _zenMode = _ZenMode(value: zenMode);
    _blindfoldChess = _BlindfoldChess(value: blindfoldChess);
    _boardScreenSide = _BoardScreenSide(value: boardScreenSide);
    _boardOrientation = _BoardOrientation(value: boardOrientation);
  }

  DisplaySettingsModel.fromAPI(UserPreferences prefs) {
    secure_storage_helper
        .getAnimationType()
        .then((value) => _pieceAnimation = value);
    secure_storage_helper.getPieceTheme().then((value) => _pieceTheme = value);
    if (prefs.highlight != null) {
      _boardHighlights = _BoardHighlights(value: prefs.highlight!);
    }
    if (prefs.destination != null) {
      _pieceDestinations = _PieceDestinations(value: prefs.destination!);
    }
    if (prefs.coords != null) {
      _boardCoordinates = _BoardCoordinates(value: prefs.coords! == 1);
    }
    if (prefs.replay != null) {
      _moveListWhilePlaying = _MoveListWhilePlaying(value: prefs.replay! > 0);
    }
    if (prefs.coords != null) {
      _boardCoordinates = _BoardCoordinates(value: prefs.coords! == 1);
    }
    if (prefs.zen != null) {
      _zenMode = _ZenMode(value: prefs.zen! == 1);
    }
    if (prefs.blindfold != null) {
      _blindfoldChess = _BlindfoldChess(value: prefs.blindfold! == 1);
    }
  }

  DisplaySettingsModel.none();
}

class _MagnifiedDraggedPiece extends SwitchSetting {
  _MagnifiedDraggedPiece({required bool value})
      : super(
          name: 'Magnified dragged piece',
          icon: Icons.search,
          value: value,
        );
}

class _BoardHighlights extends SwitchSetting {
  _BoardHighlights({required bool value})
      : super(
          name: 'Board highlights',
          icon: Icons.settings,
          value: value,
        );
}

class _MoveListWhilePlaying extends SwitchSetting {
  _MoveListWhilePlaying({required bool value})
      : super(
          name: 'Move list while playing',
          icon: Icons.settings,
          value: value,
        );
}

class _PieceDestinations extends SwitchSetting {
  _PieceDestinations({required bool value})
      : super(
          name: 'Piece destinations',
          icon: Icons.arrow_forward,
          value: value,
        );
}

class _BoardCoordinates extends SwitchSetting {
  _BoardCoordinates({required bool value})
      : super(
          name: 'Board coordinates',
          icon: Icons.grid_on,
          value: value,
        );
}

class _MoveNotation extends ButtonsSetting<MoveNotation> {
  _MoveNotation({required MoveNotation value})
      : super(
          name: 'Move notation',
          icon: Icons.format_list_numbered,
          options: MoveNotation.values,
          value: value,
        );
}

class _ZenMode extends SwitchSetting {
  _ZenMode({required bool value})
      : super(
          name: 'Zen mode',
          icon: Icons.remove_red_eye,
          value: value,
        );
}

class _BlindfoldChess extends SwitchSetting {
  _BlindfoldChess({required bool value})
      : super(
          name: 'Blindfold chess',
          icon: Icons.settings,
          value: value,
        );
}

class _BoardScreenSide extends ButtonsSetting<BoardScreenSide> {
  _BoardScreenSide({required BoardScreenSide value})
      : super(
          name: 'Board screen side',
          icon: Icons.screen_lock_rotation,
          options: BoardScreenSide.values,
          value: value,
        );
}

class _BoardOrientation extends ButtonsSetting<BoardOrientation> {
  _BoardOrientation({required BoardOrientation value})
      : super(
          name: 'Board orientation',
          icon: Icons.screen_lock_rotation,
          options: BoardOrientation.values,
          value: value,
        );
}

enum MoveNotation with Namable {
  pieces('Pieces'),
  letters('Letters');

  const MoveNotation(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum BoardScreenSide with Namable {
  left('Left'),
  right('Right');

  const BoardScreenSide(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum BoardOrientation with Namable {
  whiteOnBottom('White on bottom'),
  blackOnBottom('Black on bottom');

  const BoardOrientation(this._name);

  final String _name;

  @override
  String get name => _name;
}
