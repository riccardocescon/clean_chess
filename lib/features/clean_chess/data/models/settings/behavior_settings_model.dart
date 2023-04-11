class BehaviorSettingsModel {
  int _moveType = 0; // 0 = tap, 1 = drag, 2 + either
  bool _premove = true;
  int _takebacks = 0; // 0 = never, 1 = always, 2 = casual only
  int _promoteToQueen = 0; // 0 = never, 1 = always, 2 = when premoving
  int _drawOnThreefoldRepetition = 0; // 0 = never, 1 = always, 2 = < 30 seconds
  bool _confirmResignation = true;
  int _castlingMode = 0; // 0 = two squares, 1 = onto rook
  bool _keyboardInput = false;
  bool _snapArrows = true;
  bool _goodGameAfterDefeat = true;

  // Getters
  int get moveType => _moveType;
  bool get premove => _premove;
  int get takebacks => _takebacks;
  int get promoteToQueen => _promoteToQueen;
  int get drawOnThreefoldRepetition => _drawOnThreefoldRepetition;
  bool get confirmResignation => _confirmResignation;
  int get castlingMode => _castlingMode;
  bool get keyboardInput => _keyboardInput;
  bool get snapArrows => _snapArrows;
  bool get goodGameAfterDefeat => _goodGameAfterDefeat;

  List<dynamic> get settings => [
        _moveType,
        _premove,
        _takebacks,
        _promoteToQueen,
        _drawOnThreefoldRepetition,
        _confirmResignation,
        _castlingMode,
        _keyboardInput,
        _snapArrows,
        _goodGameAfterDefeat,
      ];

  // Setters
  set moveType(int value) => _moveType = value;
  set premove(bool value) => _premove = value;
  set takebacks(int value) => _takebacks = value;
  set promoteToQueen(int value) => _promoteToQueen = value;
  set drawOnThreefoldRepetition(int value) =>
      _drawOnThreefoldRepetition = value;
  set confirmResignation(bool value) => _confirmResignation = value;
  set castlingMode(int value) => _castlingMode = value;
  set keyboardInput(bool value) => _keyboardInput = value;
  set snapArrows(bool value) => _snapArrows = value;
  set goodGameAfterDefeat(bool value) => _goodGameAfterDefeat = value;

  BehaviorSettingsModel({
    required int moveType,
    required bool premove,
    required int takebacks,
    required int promoteToQueen,
    required int drawOnThreefoldRepetition,
    required bool confirmResignation,
    required int castlingMode,
    required bool keyboardInput,
    required bool snapArrows,
    required bool goodGameAfterDefeat,
  })  : _moveType = moveType,
        _premove = premove,
        _takebacks = takebacks,
        _promoteToQueen = promoteToQueen,
        _drawOnThreefoldRepetition = drawOnThreefoldRepetition,
        _confirmResignation = confirmResignation,
        _castlingMode = castlingMode,
        _keyboardInput = keyboardInput,
        _snapArrows = snapArrows,
        _goodGameAfterDefeat = goodGameAfterDefeat;
}
