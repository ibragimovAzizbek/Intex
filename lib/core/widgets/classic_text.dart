import 'package:flutter/material.dart';

Text classicText(String text, {double size = 20, Color color = Colors.black}) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: FontWeight.bold,
    ),
  );
}
