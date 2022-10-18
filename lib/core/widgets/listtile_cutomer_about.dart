import 'package:flutter/material.dart';

import '../constants/font_const.dart';
import 'classic_text.dart';

ListTile aboutCutomerWorldView(
  String iconPath,
  String titleText,
  String subtitleText,
) {
  return ListTile(
    leading: Image.asset(iconPath),
    title: classicText(titleText),
    subtitle: classicText(
      subtitleText,
      size: FontConst.smallFont,
    ),
  );
}
