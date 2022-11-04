import 'package:flutter/material.dart';
import 'package:intex/core/widgets/classic_text.dart';

import '../constants/color_const.dart';
import '../constants/font_const.dart';

class TextButtonForLinks extends StatelessWidget {
  String text;
  Function function;

  TextButtonForLinks({Key? key, required this.text, required this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: classicText(text,
          color: ColorConst.textColor, size: FontConst.meduimFont - 2),
      onTap: () {
        function();
      },
    );
  }
}
