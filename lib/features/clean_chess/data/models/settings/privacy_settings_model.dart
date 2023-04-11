class PrivacySettingsModel {
  bool _follow = true;
  int _challenge = 0;
  int _message = 0;
  int _study = 0;
  int _chessInsights = 0;

  // Getters
  bool get follow => _follow;
  int get challenge => _challenge;
  int get message => _message;
  int get study => _study;
  int get chessInsights => _chessInsights;

  // Setters
  set follow(bool value) => _follow = value;
  set challenge(int value) => _challenge = value;
  set message(int value) => _message = value;
  set study(int value) => _study = value;
  set chessInsights(int value) => _chessInsights = value;

  PrivacySettingsModel({
    required bool follow,
    required int challenge,
    required int message,
    required int study,
    required int chessInsights,
  })  : _follow = follow,
        _challenge = challenge,
        _message = message,
        _study = study,
        _chessInsights = chessInsights;
}
