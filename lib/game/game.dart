import 'dart:math' as math;

class Game {
  var board = [List.filled(3, -1), List.filled(3, -1), List.filled(3, -1)];

  void updateBoard(int n, int player) {
    int x = (n / 3).ceil() - 1;
    int y = n % 3 == 0 ? 2 : n % 3 - 1;
    board[x][y] = player;
  }

  void printBoard() {
    print(board);
  }
}
