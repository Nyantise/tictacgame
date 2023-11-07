import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictacgame/states/app.dart';

Padding modeContainer() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12 * w.value),
    child: Container(
      height: 6.5 * h.value,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 0.24),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: LayoutBuilder(builder: (ctx, ctt) {
        return Obx(
          () =>
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            ...config.mode.entries.map((e) {
              return modeButton(ctt, mode: e.value, key: e.key);
            }).toList()
          ]),
        );
      }),
    ),
  );
}

Widget modeButton(BoxConstraints constraints,
    {required mode, required String key}) {
  Color mycolor = mode == true ? Colors.white : Colors.transparent;
  Color textColor =
      mode == true ? const Color.fromRGBO(104, 33, 175, 1) : Colors.white;
  double padValue = 3.5;

  return Padding(
    padding: EdgeInsets.all(padValue),
    child: GestureDetector(
        child: AnimatedContainer(
            decoration: BoxDecoration(
                color: mycolor,
                borderRadius: const BorderRadius.all(Radius.circular(8.5))),
            width: (constraints.maxWidth / config.mode.length) -
                (padValue * config.mode.length),
            duration: 300.milliseconds,
            curve: Curves.easeInOut,
            child: Center(
              child: Text('vs ${key[0].toUpperCase()}${key.substring(1)}',
                  style:
                      TextStyle(color: textColor, fontWeight: FontWeight.w600)),
            )),
        onTap: () => config.selectMode(key)),
  );
}
