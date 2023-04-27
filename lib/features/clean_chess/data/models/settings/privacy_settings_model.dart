import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';

class PrivacySettingsModel {
  late final _Follow _follow;
  late final _Challenge _challenge;
  late final _Message _message;
  late final _Study _study;
  late final _ChessInsights _chessInsights;

  //getters
  SwitchSetting get follow => _follow;
  ButtonsSetting get challenge => _challenge;
  ButtonsSetting get message => _message;
  ButtonsSetting get study => _study;
  ButtonsSetting get chessInsights => _chessInsights;

  List<dynamic> get values => [
        follow,
        challenge,
        message,
        study,
        chessInsights,
      ];

  //setters
  set setFollow(bool value) => _follow.value = value;
  set setChallenge(Challenge value) => _challenge.setValueByReference = value;
  set setMessage(Message value) => _message.setValueByReference = value;
  set setStudy(Study value) => _study.setValueByReference = value;
  set setChessInsights(ChessInsights value) =>
      _chessInsights.setValueByReference = value;

  PrivacySettingsModel({
    required bool follow,
    required Challenge challenge,
    required Message message,
    required Study study,
    required ChessInsights chessInsights,
  }) {
    _follow = _Follow(value: follow);
    _challenge = _Challenge(value: challenge);
    _message = _Message(value: message);
    _study = _Study(value: study);
    _chessInsights = _ChessInsights(value: chessInsights);
  }
}

class _Follow extends SwitchSetting {
  _Follow({required bool value})
      : super(
          name: 'Follow',
          icon: Icons.person,
          value: value,
        );
}

class _Challenge extends ButtonsSetting<Challenge> {
  _Challenge({required Challenge value})
      : super(
          name: 'Challenge',
          icon: Icons.shield,
          options: Challenge.values,
          value: value,
        );
}

class _Message extends ButtonsSetting<Message> {
  _Message({required Message value})
      : super(
          name: 'Message',
          icon: Icons.message,
          options: Message.values,
          value: value,
        );
}

class _Study extends ButtonsSetting<Study> {
  _Study({required Study value})
      : super(
          name: 'Study',
          icon: Icons.book,
          options: Study.values,
          value: value,
        );
}

class _ChessInsights extends ButtonsSetting<ChessInsights> {
  _ChessInsights({required ChessInsights value})
      : super(
          name: 'Chess Insights',
          icon: Icons.bar_chart,
          options: ChessInsights.values,
          value: value,
        );
}

enum Challenge with Namable {
  never('Never'),
  always('Always'),
  friends('Friends'),
  registered('Registered'),
  rating('Rating +- 300');

  const Challenge(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum Message with Namable {
  always('Always'),
  friends('Friends'),
  existing('Only existing conversations');

  const Message(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum Study with Namable {
  never('Never'),
  always('Always'),
  friends('Friends');

  const Study(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum ChessInsights with Namable {
  noone('No one'),
  friends('Friends'),
  everyone('Everyone');

  const ChessInsights(this._name);

  final String _name;

  @override
  String get name => _name;
}
