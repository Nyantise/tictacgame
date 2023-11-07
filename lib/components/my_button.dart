import 'package:flutter/material.dart';
import 'package:tictacgame/states/app.dart';

Widget myButton(String text,
        {Color textColor = Colors.black,
        Color buttonColor = Colors.white,
        double widthPercent = 80,
        double heightPercent = 6,
        FontWeight weight = FontWeight.w500,
        required VoidCallback onPressed}) =>
    SizedBox(
      width: widthPercent * w.value,
      height: heightPercent * h.value,
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            backgroundColor: buttonColor,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)))),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(fontWeight: weight, fontSize: 18, color: textColor),
        ),
      ),
    );
