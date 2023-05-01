import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';

class LanguageSettingsModel {
  late _Language _language;

  // Getters
  ButtonsSetting get language => _language;

  List<dynamic> get values => [
        language,
      ];

  // Setters
  set setLanguage(Languages value) => _language.setValueByReference = value;

  LanguageSettingsModel({
    required Languages language,
  }) {
    _language = _Language(value: language);
  }
}

class _Language extends ButtonsSetting<Languages> {
  _Language({required Languages value})
      : super(
          name: 'Language',
          icon: Icons.language,
          options: Languages.values,
          value: value,
        );
}

enum Languages with Namable {
  english('English'),
  italian('Italiano'),
  turkish('Türkçe'),
  spanish('Español');

  const Languages(this._name);

  final String _name;

  @override
  String get name => _name;
}
