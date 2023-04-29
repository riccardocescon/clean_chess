import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';

class BehaviorSettingsModel {
  late final _MoveType _moveType;
  late final _Premove _premove;
  late final _Takebacks _takebacks;
  late final _PromoteToQueen _promoteToQueen;
  late final _DrawOnThreefoldRepetition _drawOnThreefoldRepetition;
  late final _ConfirmResignation _confirmResignation;
  late final _CastlingMode _castlingMode;
  late final _KeyboardInput _keyboardInput;
  late final _SnapArrows _snapArrows;
  late final _GoodGameAfterDefeat _goodGameAfterDefeat;

  // Getters
  ButtonsSetting get moveType => _moveType;
  SwitchSetting get premove => _premove;
  ButtonsSetting get takebacks => _takebacks;
  ButtonsSetting get promoteToQueen => _promoteToQueen;
  ButtonsSetting get drawOnThreefoldRepetition => _drawOnThreefoldRepetition;
  SwitchSetting get confirmResignation => _confirmResignation;
  ButtonsSetting get castlingMode => _castlingMode;
  SwitchSetting get keyboardInput => _keyboardInput;
  SwitchSetting get snapArrows => _snapArrows;
  SwitchSetting get goodGameAfterDefeat => _goodGameAfterDefeat;

  List<dynamic> get values => [
        moveType,
        premove,
        takebacks,
        promoteToQueen,
        drawOnThreefoldRepetition,
        confirmResignation,
        castlingMode,
        keyboardInput,
        snapArrows,
        goodGameAfterDefeat,
      ];

  // Setters
  set setMoveType(MoveType value) => _moveType.setValueByReference = value;
  set setPremove(bool value) => _premove.value = value;
  set setTakebacks(Takebacks value) => _takebacks.setValueByReference = value;
  set setPromoteToQueen(PromoteToQueen value) =>
      _promoteToQueen.setValueByReference = value;
  set setDrawOnThreefoldRepetition(DrawOnThreefoldRepetition value) =>
      _drawOnThreefoldRepetition.setValueByReference = value;
  set setConfirmResignation(bool value) => _confirmResignation.value = value;
  set setCastlingMode(CastlingMode value) =>
      _castlingMode.setValueByReference = value;
  set setKeyboardInput(bool value) => _keyboardInput.value = value;
  set setSnapArrows(bool value) => _snapArrows.value = value;
  set setGoodGameAfterDefeat(bool value) => _goodGameAfterDefeat.value = value;

  BehaviorSettingsModel({
    required MoveType moveType,
    required bool premove,
    required Takebacks takebacks,
    required PromoteToQueen promoteToQueen,
    required DrawOnThreefoldRepetition drawOnThreefoldRepetition,
    required bool confirmResignation,
    required CastlingMode castlingMode,
    required bool keyboardInput,
    required bool snapArrows,
    required bool goodGameAfterDefeat,
  }) {
    _moveType = _MoveType(value: moveType);
    _premove = _Premove(value: premove);
    _takebacks = _Takebacks(value: takebacks);
    _promoteToQueen = _PromoteToQueen(value: promoteToQueen);
    _drawOnThreefoldRepetition =
        _DrawOnThreefoldRepetition(value: drawOnThreefoldRepetition);
    _confirmResignation = _ConfirmResignation(value: confirmResignation);
    _castlingMode = _CastlingMode(value: castlingMode);
    _keyboardInput = _KeyboardInput(value: keyboardInput);
    _snapArrows = _SnapArrows(value: snapArrows);
    _goodGameAfterDefeat = _GoodGameAfterDefeat(value: goodGameAfterDefeat);
  }
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
  tap('Tap'),
  drag('Drag'),
  either('Either');

  const MoveType(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum Takebacks with Namable {
  never('Never'),
  always('Always'),
  casualOnly('Casual Only');

  const Takebacks(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum PromoteToQueen with Namable {
  never('Never'),
  always('Always'),
  whenPremove('When Premove');

  const PromoteToQueen(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum DrawOnThreefoldRepetition with Namable {
  never('Never'),
  always('Always'),
  lessThan30Seconds('Less than 30 seconds');

  const DrawOnThreefoldRepetition(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum CastlingMode with Namable {
  twoSquares('Two Squares'),
  ontoRook('Onto Rook'),
  either('Either');

  const CastlingMode(this._name);

  final String _name;

  @override
  String get name => _name;
}
