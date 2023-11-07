import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:tictacgame/states/app.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    changeToMenu();
    return Center(
        child: WidgetAnimator(
      incomingEffect: WidgetTransitionEffects.incomingScaleUp(
          duration: 700.milliseconds, curve: Curves.elasticOut),
      child: SvgPicture.asset('assets/logo.svg', height: 12 * h.value),
    ));
  }
}

changeToMenu() async {
  await Future.delayed(1200.milliseconds);
  Get.offAndToNamed('/menu');
}
