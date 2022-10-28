import 'package:flutter/material.dart';
import 'package:intex/core/constants/color_const.dart';

Text classicText(String text,
    {double size = 24,
    Color color = ColorConst.black,
    FontWeight fontWeight = FontWeight.bold,
    TextDecoration decoration = TextDecoration.none}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        decoration: decoration),
  );
}
