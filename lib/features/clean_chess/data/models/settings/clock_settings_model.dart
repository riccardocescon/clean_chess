import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class ClockSettingsModel {
  _ClockPosition? _clockPosition;
  _TenthsOfSeconds? _tenthsOfSeconds;
  _Progressbar? _progressbar;
  _SoundWhenTimeGetsCritical? _soundWhenTimeGetsCritical;
  _GiveMoreTime? _giveMoreTime;

  // Getters
  ButtonsSetting? get clockPosition => _clockPosition;
  ButtonsSetting? get tenthsOfSeconds => _tenthsOfSeconds;
  SwitchSetting? get progressbar => _progressbar;
  SwitchSetting? get soundWhenTimeGetsCritical => _soundWhenTimeGetsCritical;
  ButtonsSetting? get giveMoreTime => _giveMoreTime;

  List<dynamic> get values => [
        if (clockPosition != null) clockPosition,
        if (tenthsOfSeconds != null) tenthsOfSeconds,
        if (progressbar != null) progressbar,
        if (soundWhenTimeGetsCritical != null) soundWhenTimeGetsCritical,
        if (giveMoreTime != null) giveMoreTime,
      ];

  // Setters
  set setClockPosition(ClockPosition value) =>
      _clockPosition?.setValueByReference = value;
  set setTenthsOfSeconds(TenthsOfSeconds value) =>
      _tenthsOfSeconds?.setValueByReference = value;
  set setProgressbar(bool value) => _progressbar?.value = value;
  set setSoundWhenTimeGetsCritical(bool value) =>
      _soundWhenTimeGetsCritical?.value = value;
  set setGiveMoreTime(GiveMoreTime value) =>
      _giveMoreTime?.setValueByReference = value;

  ClockSettingsModel({
    required ClockPosition clockPosition,
    required TenthsOfSeconds tenthsOfSeconds,
    required bool progressbar,
    required bool soundWhenTimeGetsCritical,
    required GiveMoreTime giveMoreTime,
  }) {
    _clockPosition = _ClockPosition(value: clockPosition);
    _tenthsOfSeconds = _TenthsOfSeconds(value: tenthsOfSeconds);
    _progressbar = _Progressbar(value: progressbar);
    _soundWhenTimeGetsCritical =
        _SoundWhenTimeGetsCritical(value: soundWhenTimeGetsCritical);
    _giveMoreTime = _GiveMoreTime(value: giveMoreTime);
  }

  ClockSettingsModel.fromAPI(UserPreferences prefs) {
    if (prefs.moretime != null) {
      _giveMoreTime = _GiveMoreTime(
          value: GiveMoreTime.values
              .firstWhere((element) => element.id == prefs.moretime));
    }
    if (prefs.clockTenths != null) {
      _tenthsOfSeconds = _TenthsOfSeconds(
          value: TenthsOfSeconds.values
              .firstWhere((element) => element.id == prefs.clockTenths));
    }
    if (prefs.clockBar != null) {
      _progressbar = _Progressbar(value: prefs.clockBar!);
    }
    if (prefs.clockSound != null) {
      _soundWhenTimeGetsCritical =
          _SoundWhenTimeGetsCritical(value: prefs.clockSound!);
    }
  }

  ClockSettingsModel.none();
}

class _ClockPosition extends ButtonsSetting<ClockPosition> {
  _ClockPosition({required ClockPosition value})
      : super(
          name: 'Clock position',
          icon: Icons.settings,
          options: ClockPosition.values,
          value: value,
        );
}

class _TenthsOfSeconds extends ButtonsSetting<TenthsOfSeconds> {
  _TenthsOfSeconds({required TenthsOfSeconds value})
      : super(
          name: 'Tenths of seconds',
          icon: Icons.timer,
          options: TenthsOfSeconds.values,
          value: value,
        );
}

class _Progressbar extends SwitchSetting {
  _Progressbar({required bool value})
      : super(
          name: 'Progressbar',
          icon: Icons.settings,
          value: value,
        );
}

class _SoundWhenTimeGetsCritical extends SwitchSetting {
  _SoundWhenTimeGetsCritical({required bool value})
      : super(
          name: 'Sound when time gets critical',
          icon: Icons.notifications_active,
          value: value,
        );
}

class _GiveMoreTime extends ButtonsSetting<GiveMoreTime> {
  _GiveMoreTime({required GiveMoreTime value})
      : super(
          name: 'Give more time',
          icon: Icons.fast_forward,
          options: GiveMoreTime.values,
          value: value,
        );
}

enum ClockPosition with Namable {
  top('Top', 0),
  bottom('Bottom', 1);

  const ClockPosition(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum TenthsOfSeconds with Namable {
  on('On', 0),
  off('Off', 2),
  lessThan10('< 10 seconds', 1);

  const TenthsOfSeconds(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}

enum GiveMoreTime with Namable {
  on('On', 1),
  off('Off', 3),
  casualOnly('Casual only', 2);

  const GiveMoreTime(this._name, this.id);

  final String _name;
  final int id;

  @override
  String get name => _name;
}
