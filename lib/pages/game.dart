import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tictacgame/components/my_button.dart';
import 'package:tictacgame/states/app.dart';
import 'package:tictacgame/states/game.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 5 * h.value),
          Text(
            getMessage(),
            style: const TextStyle(fontSize: 24),
          ),
          Text(
            getPlayer(),
            style: TextStyle(
                fontSize: 24,
                color: game.turn.isTrue ? Colors.blue : Colors.red),
          ),
          SizedBox(height: 4 * h.value),
          drawTable(),
          SizedBox(height: 2 * h.value),
          myButton(
            'Recomeçar',
            onPressed: () {
              game.create();
            },
            buttonColor: const Color.fromRGBO(194, 200, 0, 1),
            textColor: const Color.fromRGBO(104, 33, 175, 1),
            weight: FontWeight.w600,
          ),
          SizedBox(height: 2 * h.value),
          myButton(
            'Voltar',
            onPressed: () {
              Get.offAndToNamed('/menu');
            },
            buttonColor: const Color.fromRGBO(214, 218, 1, 0.2),
            textColor: Colors.white,
          )
        ],
      ),
    );
  }
}

drawTable() {
  return LayoutBuilder(builder: (context, constraints) {
    return Obx(() {
      return Wrap(
          children: game.table.map((element) {
        return GestureDetector(
          onTap: () => game.selectCell(element),
          child: Container(
            height: constraints.maxWidth / config.table.value - 1,
            width: constraints.maxWidth / config.table.value - 1,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.transparent)),
            child: element == -1
                ? SvgPicture.asset(
                    'assets/ring.svg',
                    color: Colors.blue,
                  )
                : element == -2
                    ? SvgPicture.asset(
                        'assets/exe.svg',
                        color: Colors.red,
                      )
                    : const SizedBox(),
          ),
        );
      }).toList());
    });
  });
}

getMessage() {
  if (game.tie.isTrue) {
    return 'Foi um Empate!';
  }
  if (game.winner.value.isNotEmpty) {
    return 'O Vencedor é:';
  }
  if (game.winner.value.isEmpty) {
    return 'Vez do Jogador:';
  }
}

getPlayer() {
  if (game.tie.isTrue) {
    return '';
  }
  if (game.winner.value.isNotEmpty) {
    return game.winner.value;
  }
  if (game.turn.isTrue) {
    return player1.value;
  } else {
    return player2.value;
  }
}
