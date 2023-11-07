import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tictacgame/states/app.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    config.storageHistory.value = GetStorage().read('history') ?? [];
    return Obx(
      () => Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32.0, bottom: 12),
            child: Text(
              'Histórico',
              style: TextStyle(fontSize: 32),
            ),
          ),
          Expanded(
            child: ListView(
                children: config.storageHistory.map((element) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    height: 10 * h.value,
                    width: 80 * w.value,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: element['tie'] == false
                              ? [Colors.white, Colors.amber.shade500]
                              : [Colors.white, Colors.green],
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Stack(
                      children: [
                        Positioned(
                            top: 1.5 * h.value,
                            left: 12,
                            child: Text(
                                element['tie'] == false
                                    ? 'Vencedor: ${element['winner']}'
                                    : 'Jogador 1: ${element['player1']}',
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w800))),
                        Positioned(
                            top: 5 * h.value,
                            left: 12,
                            child: Text(
                                element['tie'] == false
                                    ? 'Perdedor: ${element['loser']}'
                                    : 'Jogador 2: ${element['player2']}',
                                style: TextStyle(
                                    color: Colors.red.shade400,
                                    fontWeight: FontWeight.w800))),
                        Positioned(
                            top: 0.5 * h.value,
                            right: 12,
                            child: Text(
                              element['tie'] == false ? 'VITÓRIA' : 'EMPATE',
                              style: const TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w600),
                            )),
                        Positioned(
                            top: 5.5 * h.value,
                            right: 12,
                            child: Text(
                              element['data']
                                  .toString()
                                  .substring(0, element['data'].length - 7),
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            )),
                      ],
                    )),
              );
            }).toList()),
          ),
        ],
      ),
    );
  }
}
