import 'package:flutter/material.dart';
import 'package:intex/core/func/show_diolog_order_product.dart';
import 'package:intex/extensions/mq_extension.dart';

import '../constants/color_const.dart';
import '../constants/font_const.dart';

Stack productAndOrdering(
  BuildContext context,
  String text,
  String imagePath,
  double originalPrice,
  double discountPrice,
) {
  return Stack(
    children: [
      Container(
        height: context.h * 0.35,
        width: context.w * 0.8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          color: ColorConst.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: FontConst.meduimFont,
                color: ColorConst.primaryColor,
              ),
            ),
            SizedBox(
              height: context.h * 0.14,
              width: context.w * 0.5,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "$originalPrice сум",
                      style: TextStyle(
                        color: ColorConst.salePriceColor,
                      ),
                    ),
                    Text(
                      "$discountPrice сум",
                      style: TextStyle(
                        color: ColorConst.black,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: context.h * 0.035,
                    width: context.w * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      color: ColorConst.primaryAmber,
                    ),
                    child: Text(
                      "Заказать",
                      style: TextStyle(color: ColorConst.black),
                    ),
                  ),
                  onTap: () {
                    alertDiologOrderAProduct(context, text);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned(
        top: 1,
        left: 2,
        child: Container(
          alignment: Alignment.center,
          height: context.h * 0.03,
          width: context.w * 0.3,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(17),
            ),
            color: ColorConst.recommendColor,
          ),
          child: const Text(
            'Рекомендуем',
            style: TextStyle(color: ColorConst.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ],
  );
}
