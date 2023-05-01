import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class BehaviorSettingsModel {
  _MoveType? _moveType;
  _Premove? _premove;
  _Takebacks? _takebacks;
  _PromoteToQueen? _promoteToQueen;
  _DrawOnThreefoldRepetition? _drawOnThreefoldRepetition;
  _ConfirmResignation? _confirmResignation;
  _CastlingMode? _castlingMode;
  _KeyboardInput? _keyboardInput;
  _SnapArrows? _snapArrows;
  _GoodGameAfterDefeat? _goodGameAfterDefeat;

  // Getters
  ButtonsSetting? get moveType => _moveType;
  SwitchSetting? get premove => _premove;
  ButtonsSetting? get takebacks => _takebacks;
  ButtonsSetting? get promoteToQueen => _promoteToQueen;
  ButtonsSetting? get drawOnThreefoldRepetition => _drawOnThreefoldRepetition;
  SwitchSetting? get confirmResignation => _confirmResignation;
  ButtonsSetting? get castlingMode => _castlingMode;
  SwitchSetting? get keyboardInput => _keyboardInput;
  SwitchSetting? get snapArrows => _snapArrows;
  SwitchSetting? get goodGameAfterDefeat => _goodGameAfterDefeat;

  List<dynamic> get values => [
        if (moveType != null) moveType,
        if (premove != null) premove,
        if (takebacks != null) takebacks,
        if (promoteToQueen != null) promoteToQueen,
        if (drawOnThreefoldRepetition != null) drawOnThreefoldRepetition,
        if (confirmResignation != null) confirmResignation,
        if (castlingMode != null) castlingMode,
        if (keyboardInput != null) keyboardInput,
        if (snapArrows != null) snapArrows,
        if (goodGameAfterDefeat != null) goodGameAfterDefeat,
      ];

  // Setters
  set setMoveType(MoveType value) => _moveType?.setValueByReference = value;
  set setPremove(bool value) => _premove?.value = value;
  set setTakebacks(Takebacks value) => _takebacks?.setValueByReference = value;
  set setPromoteToQueen(PromoteToQueen value) =>
      _promoteToQueen?.setValueByReference = value;
  set setDrawOnThreefoldRepetition(DrawOnThreefoldRepetition value) =>
      _drawOnThreefoldRepetition?.setValueByReference = value;
  set setConfirmResignation(bool value) => _confirmResignation?.value = value;
  set setCastlingMode(CastlingMode value) =>
      _castlingMode?.setValueByReference = value;
  set setKeyboardInput(bool value) => _keyboardInput?.value = value;
  set setSnapArrows(bool value) => _snapArrows?.value = value;
  set setGoodGameAfterDefeat(bool value) => _goodGameAfterDefeat?.value = value;

  BehaviorSettingsModel({
    required MoveType? moveType,
    required bool? premove,
    required Takebacks? takebacks,
    required PromoteToQueen? promoteToQueen,
    required DrawOnThreefoldRepetition? drawOnThreefoldRepetition,
    required bool? confirmResignation,
    required CastlingMode? castlingMode,
    required bool? keyboardInput,
    required bool? snapArrows,
    required bool? goodGameAfterDefeat,
  }) {
    if (moveType != null) _moveType = _MoveType(value: moveType);
    if (premove != null) _premove = _Premove(value: premove);
    if (takebacks != null) _takebacks = _Takebacks(value: takebacks);
    if (promoteToQueen != null) {
      _promoteToQueen = _PromoteToQueen(value: promoteToQueen);
    }
    if (drawOnThreefoldRepetition != null) {
      _drawOnThreefoldRepetition =
          _DrawOnThreefoldRepetition(value: drawOnThreefoldRepetition);
    }
    if (confirmResignation != null) {
      _confirmResignation = _ConfirmResignation(value: confirmResignation);
    }
    if (castlingMode != null) {
      _castlingMode = _CastlingMode(value: castlingMode);
    }
    if (keyboardInput != null) {
      _keyboardInput = _KeyboardInput(value: keyboardInput);
    }
    if (snapArrows != null) _snapArrows = _SnapArrows(value: snapArrows);
    if (goodGameAfterDefeat != null) {
      _goodGameAfterDefeat = _GoodGameAfterDefeat(value: goodGameAfterDefeat);
    }
  }

  BehaviorSettingsModel.fromAPI(UserPreferences prefs) {
    if (prefs.moveEvent != null) {
      _moveType = _MoveType(
          value: MoveType.values
              .firstWhere((element) => element.id == prefs.moveEvent));
    }
    if (prefs.premove != null) {
      _premove = _Premove(value: prefs.premove!);
    }
    if (prefs.takeback != null) {
      _takebacks = _Takebacks(
          value: Takebacks.values
              .firstWhere((element) => element.id == prefs.takeback));
    }
    if (prefs.autoQueen != null) {
      _promoteToQueen = _PromoteToQueen(
          value: PromoteToQueen.values
              .firstWhere((element) => element.id == prefs.autoQueen));
    }
    if (prefs.confirmResign != null) {
      _confirmResignation =
          _ConfirmResignation(value: prefs.confirmResign! == 1);
    }
    if (prefs.rookCastle != null) {
      _castlingMode = _CastlingMode(
          value: CastlingMode.values
              .firstWhere((element) => element.id == prefs.rookCastle));
    }
    if (prefs.keyboardMove != null) {
      _keyboardInput = _KeyboardInput(value: prefs.keyboardMove! == 1);
    }
  }

  BehaviorSettingsModel.none();
}

class _MoveType extends ButtonsSetting<MoveType> {
  _MoveType({required MoveType value})
      : super(
          name: 'Move Type',
          icon: Icons.input,
          options: MoveType.values,
          value: value,
        );
}

class _Premove extends SwitchSetting {
  _Premove({required bool value})
      : super(
          name: 'Premove',
          icon: Icons.zoom_out_map,
          value: value,
        );
}

class _Takebacks extends ButtonsSetting<Takebacks> {
  _Takebacks({required Takebacks value})
      : super(
          name: 'Takebacks',
          icon: Icons.threesixty,
          options: Takebacks.values,
          value: value,
        );
}

class _PromoteToQueen extends ButtonsSetting<PromoteToQueen> {
  _PromoteToQueen({required PromoteToQueen value})
      : super(
          name: 'Promote to Queen',
          icon: Icons.settings,
          options: PromoteToQueen.values,
          value: value,
        );
}

class _DrawOnThreefoldRepetition
    extends ButtonsSetting<DrawOnThreefoldRepetition> {
  _DrawOnThreefoldRepetition({required DrawOnThreefoldRepetition value})
      : super(
          name: 'Draw on Threefold',
          icon: Icons.settings,
          options: DrawOnThreefoldRepetition.values,
          value: value,
        );
}

class _ConfirmResignation extends SwitchSetting {
  _ConfirmResignation({required bool value})
      : super(
          name: 'Confirm Resignation',
          icon: Icons.settings,
          value: value,
        );
}

class _CastlingMode extends ButtonsSetting<CastlingMode> {
  _CastlingMode({required CastlingMode value})
      : super(
          name: 'Castling Mode',
          icon: Icons.settings,
          options: CastlingMode.values,
          value: value,
        );
}

class _KeyboardInput extends SwitchSetting {
  _KeyboardInput({required bool value})
      : super(
          name: 'Keyboard Input',
          icon: Icons.keyboard,
          value: value,
        );
}

class _SnapArrows extends SwitchSetting {
  _SnapArrows({required bool value})
      : super(
          name: 'Snap Arrows',
          icon: Icons.arrow_outward,
          value: value,
        );
}

class _GoodGameAfterDefeat extends SwitchSetting {
  _GoodGameAfterDefeat({required bool value})
      : super(
          name: 'Good Game After Defeat',
          icon: Icons.sentiment_satisfied,
          value: value,
        );
}

enum MoveType with Namable {
  tap('Tap', 0),
  drag('Drag', 1),
  either('Either', 2);

  const MoveType(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum Takebacks with Namable {
  never('Never', 1),
  always('Always', 2),
  casualOnly('Casual Only', 3);

  const Takebacks(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum PromoteToQueen with Namable {
  never('Never', 0),
  always('Always', 1),
  whenPremove('When Premove', 2);

  const PromoteToQueen(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum DrawOnThreefoldRepetition with Namable {
  never('Never', 0),
  always('Always', 1),
  lessThan30Seconds('Less than 30 seconds', 2);

  const DrawOnThreefoldRepetition(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum CastlingMode with Namable {
  twoSquares('Two Squares', 0),
  ontoRook('Onto Rook', 1),
  either('Either', 2);

  const CastlingMode(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}
