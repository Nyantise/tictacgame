import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tictacgame/components/mode_selector.dart';
import 'package:tictacgame/components/my_button.dart';
import 'package:tictacgame/components/player_form.dart';
import 'package:tictacgame/components/table_slider.dart';
import 'package:tictacgame/states/app.dart';
import 'package:tictacgame/states/game.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    RxDouble logoPos = 50.0.obs;
    RxBool showOrNot = false.obs;
    init() async {
      await Future.delayed(1000.milliseconds);
      logoPos.value = 15;
      await Future.delayed(1000.milliseconds);
      showOrNot.value = true;
    }

    init();
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: 1000.milliseconds,
            curve: Curves.elasticOut,
            height: logoPos * h.value,
          ),
          Transform.translate(
            offset: Offset(0, -6 * h.value),
            child: SvgPicture.asset(
              'assets/logo.svg',
              height: 12 * h.value,
            ),
          ),
          ...showMenu(showOrNot.value)
        ],
      ),
    );
  }
}

// ------------------------ M E N U   I T E M S ----->
List<Widget> menuItems = [
  const Text(
    'Tipo de Jogo',
    style: TextStyle(fontSize: 24),
  ),
  modeContainer(),
  playerForm,
  SizedBox(height: 2 * h.value),
  const Text(
    'Tamanho do Tabuleiro',
    style: TextStyle(fontSize: 24),
  ),
  tableSlider,
  SizedBox(height: 5 * h.value),
  myButton(
    'Começar partida',
    buttonColor: const Color.fromRGBO(194, 200, 0, 1),
    textColor: const Color.fromRGBO(104, 33, 175, 1),
    weight: FontWeight.w600,
    onPressed: () {
      var nickError = config.playerNameCheck();
      if (nickError) {
        return;
      }
      game.create();
      Get.offAndToNamed('/game');
    },
  ),
  Padding(
    padding: EdgeInsets.only(top: h.value),
    child: myButton(
      'Histórico de partidas',
      buttonColor: const Color.fromRGBO(214, 218, 1, 0.2),
      textColor: Colors.white,
      onPressed: () {
        Get.toNamed('/history');
      },
    ),
  ),
];

showMenu(bool show) {
  if (show) {
    return menuItems.asMap().entries.map((e) {
      int delay = e.key * 300;
      Widget element = e.value;
      return WidgetAnimator(
        incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(
            delay: delay.milliseconds,
            curve: Curves.elasticOut,
            duration: 1250.milliseconds),
        child: element,
      );
    }).toList();
  } else {
    return [];
  }
}
