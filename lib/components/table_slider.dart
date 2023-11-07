import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:tictacgame/states/app.dart';

Widget tableSlider = Obx(
  () => SizedBox(
    width: 80 * w.value,
    child: SfSlider(
      min: 3,
      max: 10,
      value: config.table.value,
      interval: 1,
      activeColor: const Color.fromRGBO(194, 200, 0, 1),
      inactiveColor: Colors.deepPurple.shade700,
      showLabels: true,
      enableTooltip: true,
      minorTicksPerInterval: 1,
      onChanged: (value) {
        double val = value as double;
        config.table.value = val.round();
      },
    ),
  ),
);
