import 'dart:math';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tictacgame/states/app.dart';

Game game = Game();

class Game extends GetxController {
  RxBool turn = true.obs;
  RxList table = <int>[].obs;
  RxString winner = ''.obs;
  RxString loser = ''.obs;
  RxBool tie = false.obs;

  List<List<int>> columns = [<int>[]];
  List<List<int>> rows = [<int>[]];
  List<List<int>> posdiagonal = [<int>[]];
  List<List<int>> negdiagonal = [<int>[]];

  void selectCell(int id) {
    if (id < 0) {
      return;
    }
    if (winner.value.isNotEmpty) {
      return;
    }
    if (turn.isTrue) {
      table[id - 1] = -1;
    } else {
      table[id - 1] = -2;
    }

    table.refresh();
    checkWin();
    if (winner.value.isNotEmpty) {
      return;
    }
    turn.value = !turn.value;
  }

  void create() {
    turn.value = Random().nextBool();
    tie.value = false;
    winner.value = '';
    loser.value = '';
    generateTable();
    generateWinPossibilities();
  }

  void generateTable() {
    table.clear();
    for (var i = 0; i < pow(config.table.value, 2); i++) {
      table.add(i + 1);
    }
  }

  void generateWinPossibilities() {
    int div = config.table.value;
    columns.clear();
    rows.clear();
    posdiagonal.clear();
    negdiagonal.clear();

    posdiagonal.add(List.generate(div, (index) => index * (div + 1)));
    negdiagonal.add(List.generate(div, (index) => (index + 1) * (div - 1)));

    for (var i = 0; i < div; i++) {
      columns.add(List.generate(div, (index) => (index * div) + i));
      rows.add(List.generate(div, (index) => index + i * div));
    }
  }

  void checkWin() {
    //Columns
    for (var column in columns) {
      final firstValue = table[column[0]];
      int count = 0;
      for (var index in column) {
        if (firstValue == table[index]) {
          count++;
        }
      }
      if (count == config.table.value) {
        win(firstValue);
      }
    }
    //Rows
    for (var row in rows) {
      final firstValue = table[row[0]];
      int count = 0;
      for (var index in row) {
        if (firstValue == table[index]) {
          count++;
        }
      }
      if (count == config.table.value) {
        win(firstValue);
      }
    }
    //Diagonal Positive
    for (var diagonal in posdiagonal) {
      final firstValue = table[diagonal[0]];
      int count = 0;
      for (var index in diagonal) {
        if (firstValue == table[index]) {
          count++;
        }
      }
      if (count == config.table.value) {
        win(firstValue);
      }
    }
    //Diagonal Negative
    for (var diagonal in negdiagonal) {
      final firstValue = table[diagonal[0]];
      int count = 0;
      for (var index in diagonal) {
        if (firstValue == table[index]) {
          count++;
        }
      }
      if (count == config.table.value) {
        win(firstValue);
      }
    }
    //Tie
    int countpositives = 0;
    for (var element in table) {
      if (element >= 0) {
        countpositives++;
      }
    }
    if (countpositives == 0) {
      tie.value = true;
      recordGame();
    }
  }

  void win(int win) {
    if (win == -1) {
      winner.value = player1.value;
      loser.value = player2.value;
    } else {
      winner.value = player2.value;
      loser.value = player1.value;
    }

    recordGame();
  }

  void recordGame() {
    List<dynamic> history = GetStorage().read('history') ?? [];
    DateTime now = DateTime.now();
    if (tie.isFalse) {
      history.add({
        'data': now.toString(),
        'winner': winner.value,
        'loser': loser.value,
        'tie': tie.value
      });
    } else {
      history.add({
        'data': now.toString(),
        'player1': player1.value,
        'player2': player2.value,
        'tie': tie.value
      });
    }

    GetStorage().write('history', history);
  }
}
