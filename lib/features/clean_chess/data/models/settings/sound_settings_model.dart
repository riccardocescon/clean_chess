class SoundSettingsModel {
  bool _notifications = true;
  bool _vibrate = true;
  bool _sound = true;

  // Getters
  bool get notifications => _notifications;
  bool get vibrate => _vibrate;
  bool get sound => _sound;

  // Setters
  set notifications(bool value) => _notifications = value;
  set vibrate(bool value) => _vibrate = value;
  set sound(bool value) => _sound = value;

  SoundSettingsModel({
    required bool notifications,
    required bool vibrate,
    required bool sound,
  })  : _notifications = notifications,
        _vibrate = vibrate,
        _sound = sound;
}
