import 'package:cleanchess/features/clean_chess/domain/entities/settings/setting.dart';
import 'package:flutter/material.dart';
import 'package:lichess_client_dio/lichess_client_dio.dart';

class SoundSettingsModel {
  Notifications? _notifications;
  Vibrate? _vibrate;
  Sound? _sound;

  // Getters
  SwitchSetting? get notifications => _notifications;
  SwitchSetting? get vibrate => _vibrate;
  SwitchSetting? get sound => _sound;

  List<dynamic> get values => [
        if (notifications != null) notifications,
        if (vibrate != null) vibrate,
        if (sound != null) sound,
      ];

  // Setters
  set setNotifications(bool value) => _notifications?.value = value;
  set setVibrate(bool value) => _vibrate?.value = value;
  set setSound(bool value) => _sound?.value = value;

  SoundSettingsModel({
    required bool notifications,
    required bool vibrate,
    required bool sound,
  }) {
    _notifications = Notifications(value: notifications);
    _vibrate = Vibrate(value: vibrate);
    _sound = Sound(value: sound);
  }

  SoundSettingsModel.fromAPI(UserPreferences prefs) {
    // if(prefs.soundSet != null) {
    //   _sound = Sound(value: prefs.soundSet!);
    // }
  }

  SoundSettingsModel.none();
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
