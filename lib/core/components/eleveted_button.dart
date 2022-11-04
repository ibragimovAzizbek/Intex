import 'package:flutter/material.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/core/func/show_diolog_order_product.dart';

import '../constants/color_const.dart';
import '../widgets/classic_text.dart';

ElevatedButton elevatedButtonBig(
  BuildContext context,
  String title,
  Function function,
) =>
    ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(MediaQuery.of(context).size.width * 0.83,
            MediaQuery.of(context).size.height * 0.065),
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
        fixedSize: Size(MediaQuery.of(context).size.width * 0.6,
            MediaQuery.of(context).size.height * 0.065),
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
      onPressed: () {
        alertDiologOrderAProduct(context, "Ваш заказ");
      },
    );
