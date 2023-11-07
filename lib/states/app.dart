import 'package:get/get.dart';

RxDouble h = 0.0.obs;
RxDouble w = 0.0.obs;
RxString player1 = 'ply1'.obs;
RxString player2 = 'plae2'.obs;

var config = Config();

class Config extends GetxController {
  RxList storageHistory = <dynamic>[].obs;
  RxInt table = 3.obs;
  RxMap mode = {'jogador': true, 'bot': false}.obs;

  void selectMode(String modeName) {
    for (var e in mode.entries) {
      if (e.key == modeName) {
        mode[e.key] = true;
      } else {
        mode[e.key] = false;
      }

      if (modeName == 'bot') {
        player2.value = '';
      }
    }
  }

  playerNameCheck() {
    //Case VS Bot
    if (config.mode['bot'] == true) {
      if (player1.value.length <= 1) {
        Get.snackbar(
            'Jogador com nome muito pequeno', 'Por favor, use um nome maior');
        return true;
      }
    }
    //
    //
    //Case VS Player
    if (config.mode['jogador'] == true) {
      if (player1.value.length <= 1 || player2.value.length <= 1) {
        Get.snackbar(
            'Jogador com nome muito pequeno', 'Por favor, use um nome maior');
        return true;
      }
      if (player1.value == player2.value) {
        Get.snackbar(
            'Jogadores com nomes idênticos', 'Por favor, usem nomes distintos');
        return true;
      }
    }
    return false;
  }
}
