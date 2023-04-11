class ClockSettingsModel {
  int _clockPosition = 0; // 0 = top, 1 = bottom
  int _tenthsOfSeconds = 0; // 0 = on, 1 = off, 2 = < 10 seconds
  bool _progressbar = true;
  bool _soundWhenTimeGetsCritical = true;
  int _giveMoreTime = 0; // 0 = on, 1 = off, 2 = casual only

  // Getters
  int get clockPosition => _clockPosition;
  int get tenthsOfSeconds => _tenthsOfSeconds;
  bool get progressbar => _progressbar;
  bool get soundWhenTimeGetsCritical => _soundWhenTimeGetsCritical;
  int get giveMoreTime => _giveMoreTime;

  // Setters
  set clockPosition(int value) => _clockPosition = value;
  set tenthsOfSeconds(int value) => _tenthsOfSeconds = value;
  set progressbar(bool value) => _progressbar = value;
  set soundWhenTimeGetsCritical(bool value) =>
      _soundWhenTimeGetsCritical = value;
  set giveMoreTime(int value) => _giveMoreTime = value;

  ClockSettingsModel({
    required int clockPosition,
    required int tenthsOfSeconds,
    required bool progressbar,
    required bool soundWhenTimeGetsCritical,
    required int giveMoreTime,
  })  : _clockPosition = clockPosition,
        _tenthsOfSeconds = tenthsOfSeconds,
        _progressbar = progressbar,
        _soundWhenTimeGetsCritical = soundWhenTimeGetsCritical,
        _giveMoreTime = giveMoreTime;
}
