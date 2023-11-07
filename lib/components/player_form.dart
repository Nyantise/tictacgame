import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tictacgame/states/app.dart';

Form playerForm = Form(
  child: Padding(
    padding:
        EdgeInsets.symmetric(horizontal: 12 * w.value, vertical: 2 * h.value),
    child: Obx(
      () => Column(
        children: [
          SizedBox(
            height: 8 * h.value,
            child: TextFormField(
              decoration: myInputDecoration('Jogador 1'),
              onChanged: (val) {
                player1.value = val;
              },
              initialValue: player1.value,
            ),
          ),
          SizedBox(
            height: 1.5 * h.value,
          ),
          SizedBox(
            height: 8 * h.value,
            child: TextFormField(
              enabled: config.mode['jogador'],
              decoration: myInputDecoration('Jogador 2'),
              onChanged: (val) {
                player2.value = val;
              },
              initialValue: player2.value,
            ),
          ),
        ],
      ),
    ),
  ),
);

InputDecoration myInputDecoration(String text) => InputDecoration(
      hintText: text,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(16))),
      disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(6))),
    );
