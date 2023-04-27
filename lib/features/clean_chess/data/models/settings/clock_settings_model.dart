import 'package:cleanchess/core/utilities/mixins/nameable.dart';
import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';

class ClockSettingsModel {
  late final _ClockPosition _clockPosition;
  late final _TenthsOfSeconds _tenthsOfSeconds;
  late final _Progressbar _progressbar;
  late final _SoundWhenTimeGetsCritical _soundWhenTimeGetsCritical;
  late final _GiveMoreTime _giveMoreTime;

  // Getters
  ButtonsSetting get clockPosition => _clockPosition;
  ButtonsSetting get tenthsOfSeconds => _tenthsOfSeconds;
  SwitchSetting get progressbar => _progressbar;
  SwitchSetting get soundWhenTimeGetsCritical => _soundWhenTimeGetsCritical;
  ButtonsSetting get giveMoreTime => _giveMoreTime;

  List<dynamic> get values => [
        clockPosition,
        tenthsOfSeconds,
        progressbar,
        soundWhenTimeGetsCritical,
        giveMoreTime,
      ];

  // Setters
  set setClockPosition(ClockPosition value) =>
      _clockPosition.setValueByReference = value;
  set setTenthsOfSeconds(TenthsOfSeconds value) =>
      _tenthsOfSeconds.setValueByReference = value;
  set setProgressbar(bool value) => _progressbar.value = value;
  set setSoundWhenTimeGetsCritical(bool value) =>
      _soundWhenTimeGetsCritical.value = value;
  set setGiveMoreTime(GiveMoreTime value) =>
      _giveMoreTime.setValueByReference = value;

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
  top('Top'),
  bottom('Bottom');

  const ClockPosition(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum TenthsOfSeconds with Namable {
  on('On'),
  off('Off'),
  lessThan10('< 10 seconds');

  const TenthsOfSeconds(this._name);

  final String _name;

  @override
  String get name => _name;
}

enum GiveMoreTime with Namable {
  on('On'),
  off('Off'),
  casualOnly('Casual only');

  const GiveMoreTime(this._name);

  final String _name;

  @override
  String get name => _name;
}
