import 'package:flutter/material.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/extensions/mq_extension.dart';

import '../constants/color_const.dart';
import '../widgets/classic_text.dart';

ElevatedButton elevatedButtonBig(
  BuildContext context,
  String title,
  Function function,
) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(context.w * 0.83, context.h * 0.065),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: ColorConst.baseColor,
      ),
      child: classicText(
        title, // ! BU YERDA TRAJIMA QILINISHI KERAK
        color: ColorConst.white,
        size: FontConst.meduimFont + 2,
        fontWeight: FontWeight.w700,
      ),
      onPressed: () async {
        await function();
      },
    );

ElevatedButton elevatedButtonMeduim(
  BuildContext context,
  String title,
  Function function,
) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(context.w * 0.6, context.h * 0.065),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: ColorConst.baseColor,
      ),
      child: classicText(
        title, // ! BU YERDA TRAJIMA QILINISHI KERAK
        color: ColorConst.white,
        size: FontConst.meduimFont + 2,
        fontWeight: FontWeight.w700,
      ),
      onPressed: () async {
        await function();
      },
    );
