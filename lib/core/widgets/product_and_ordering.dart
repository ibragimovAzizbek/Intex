import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intex/core/components/eleveted_button.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/extensions/mq_extension.dart';

import '../constants/color_const.dart';
import '../constants/font_const.dart';

Stack productAndOrdering(
  BuildContext context,
  String text,
  String imagePath,
  double originalPrice,
  double discountPrice,
  String sizeSwimmingPool,
  String status,
) {
  return Stack(
    children: [
      Padding(
        padding: EdgeInsets.only(left: context.w * 0.021),
        child: Container(
          width: context.w * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorConst.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.h * 0.05),
              Center(
                child: SizedBox(
                  height: context.h * 0.16,
                  width: context.w * 0.5,
                  child: CachedNetworkImage(imageUrl: imagePath),
                ),
              ),
              SizedBox(height: context.h * 0.02),
              Divider(thickness: 3, color: ColorConst.containerBackground),
              SizedBox(height: context.h * 0.01),
              Padding(
                padding: EdgeInsets.only(left: context.w * 0.035),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.w * 0.8,
                      child: classicText(text, size: FontConst.meduimFont),
                    ),
                    SizedBox(height: context.h * 0.013),
                    classicText(sizeSwimmingPool,
                        color: ColorConst.textColor,
                        fontWeight: FontWeight.normal,
                        size: FontConst.meduimFont - 2),
                    SizedBox(height: context.h * 0.013),
                    classicText(
                      "$originalPrice  ${"currency_name".tr()}",
                      decoration: TextDecoration.lineThrough,
                      color: ColorConst.salePriceColor,
                      size: FontConst.smallFont,
                    ),
                    SizedBox(height: context.h * 0.005),
                    classicText(
                      "$discountPrice ${"currency_name".tr()}",
                      color: ColorConst.accentColor,
                      size: FontConst.meduimFont - 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h * 0.017),
              Center(child: elevatedButtonMeduim(context, "Заказать", () {}))
            ],
          ),
        ),
      ),
      Positioned(
        top: 16,
        left: 9,
        child: Container(
          alignment: Alignment.center,
          height: context.h * 0.037,
          width: context.w * 0.28,
          decoration: BoxDecoration(
            color: status == "Хит продаж"
                ? ColorConst.statusPopular
                : ColorConst.statusNew,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
          child: classicText(status,
              size: FontConst.smallFont, color: ColorConst.white),
        ),
      )
    ],
  );
}


// productAndOrdering(
// context,
// data[1][index].frameUz,
// data[1][index].image,
// data[1][index].oldPrice,
// data[1][index].oldPrice,
//                                               );