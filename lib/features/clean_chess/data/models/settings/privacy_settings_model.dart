import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class PrivacySettingsModel {
  _Follow? _follow;
  _Challenge? _challenge;
  _Message? _message;
  _Study? _study;
  _ChessInsights? _chessInsights;

  //getters
  SwitchSetting? get follow => _follow;
  ButtonsSetting? get challenge => _challenge;
  ButtonsSetting? get message => _message;
  ButtonsSetting? get study => _study;
  ButtonsSetting? get chessInsights => _chessInsights;

  List<dynamic> get values => [
        if (follow != null) follow,
        if (challenge != null) challenge,
        if (message != null) message,
        if (study != null) study,
        if (chessInsights != null) chessInsights,
      ];

  //setters
  set setFollow(bool value) => _follow?.value = value;
  set setChallenge(Challenge value) => _challenge?.setValueByReference = value;
  set setMessage(Message value) => _message?.setValueByReference = value;
  set setStudy(Study value) => _study?.setValueByReference = value;
  set setChessInsights(ChessInsights value) =>
      _chessInsights?.setValueByReference = value;

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

  PrivacySettingsModel.fromAPI(UserPreferences prefs) {
    if (prefs.follow != null) {
      _follow = _Follow(value: prefs.follow!);
    }
    if (prefs.challenge != null) {
      _challenge = _Challenge(
          value: Challenge.values
              .firstWhere((element) => element.id == prefs.challenge));
    }
    if (prefs.message != null) {
      _message = _Message(
          value: Message.values
              .firstWhere((element) => element.id == prefs.message));
    }
    if (prefs.insightShare != null) {
      _chessInsights = _ChessInsights(
          value: ChessInsights.values
              .firstWhere((element) => element.id == prefs.insightShare));
    }
  }

  PrivacySettingsModel.none();
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
  never('Never', 1),
  always('Always', 2),
  friends('Friends', 3),
  registered('Registered', 4),
  rating('Rating +- 300', 5);

  const Challenge(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum Message with Namable {
  always('Always', 1),
  friends('Friends', 2),
  existing('Only existing conversations', 3);

  const Message(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum Study with Namable {
  never('Never', 1),
  always('Always', 2),
  friends('Friends', 3);

  const Study(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum ChessInsights with Namable {
  noone('No one', 1),
  friends('Friends', 2),
  everyone('Everyone', 3);

  const ChessInsights(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}
