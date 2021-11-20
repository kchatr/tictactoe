class Player {
  static int _player = 1;

  static int getPlayer() {
    return _player;
  }

  static void updatePlayer() {
    _player = _player == 1 ? 2 : 1;
  }
}
