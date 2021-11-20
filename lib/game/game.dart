import 'dart:math' as math;

class Game {
  static var board = [List.filled(3, 0), List.filled(3, 0), List.filled(3, 0)];

  static void updateBoard(int n, int player) {
    int x = (n / 3).ceil() - 1;
    int y = n % 3 == 0 ? 2 : n % 3 - 1;
    board[x][y] = player;
  }

  static int getSquare(int n) {
    int x = (n / 3).ceil() - 1;
    int y = n % 3 == 0 ? 2 : n % 3 - 1;

    return board[x][y];
  }

  static int winner() {
    if (getSquare(1) == getSquare(2) && getSquare(2) == getSquare(3)) {
      return getSquare(1);
    } else if (getSquare(4) == getSquare(5) && getSquare(4) == getSquare(6)) {
      return getSquare(4);
    } else if (getSquare(7) == getSquare(8) && getSquare(8) == getSquare(9)) {
      return getSquare(7);
    } else if (getSquare(1) == getSquare(4) && getSquare(4) == getSquare(7)) {
      return getSquare(1);
    } else if (getSquare(2) == getSquare(5) && getSquare(5) == getSquare(8)) {
      return getSquare(2);
    } else if (getSquare(3) == getSquare(6) && getSquare(6) == getSquare(9)) {
      return getSquare(3);
    } else if (getSquare(1) == getSquare(5) && getSquare(5) == getSquare(9)) {
      return getSquare(1);
    } else if (getSquare(3) == getSquare(5) && getSquare(5) == getSquare(7)) {
      return getSquare(3);
    } else {
      return 0;
    }
  }
}
