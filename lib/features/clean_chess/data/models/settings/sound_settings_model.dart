import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';

class SoundSettingsModel {
  late final Notifications _notifications;
  late final Vibrate _vibrate;
  late final Sound _sound;

  // Getters
  SwitchSetting get notifications => _notifications;
  SwitchSetting get vibrate => _vibrate;
  SwitchSetting get sound => _sound;

  List<dynamic> get values => [
        notifications,
        vibrate,
        sound,
      ];

  // Setters
  set setNotifications(bool value) => _notifications.value = value;
  set setVibrate(bool value) => _vibrate.value = value;
  set setSound(bool value) => _sound.value = value;

  SoundSettingsModel({
    required bool notifications,
    required bool vibrate,
    required bool sound,
  }) {
    _notifications = Notifications(value: notifications);
    _vibrate = Vibrate(value: vibrate);
    _sound = Sound(value: sound);
  }
}

class Notifications extends SwitchSetting {
  Notifications({required bool value})
      : super(
          name: 'Notifications',
          icon: Icons.notifications,
          value: value,
        );
}

class Vibrate extends SwitchSetting {
  Vibrate({required bool value})
      : super(
          name: 'Vibrate',
          icon: Icons.vibration,
          value: value,
        );
}

class Sound extends SwitchSetting {
  Sound({required bool value})
      : super(
          name: 'Sound',
          icon: Icons.volume_up,
          value: value,
        );
}
