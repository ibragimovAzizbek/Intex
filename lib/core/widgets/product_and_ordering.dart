import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intex/core/components/eleveted_button.dart';
import 'package:intex/core/widgets/classic_text.dart';

import '../constants/color_const.dart';
import '../constants/font_const.dart';

Stack productAndOrdering(
  BuildContext context,
  String text,
  String imagePath,
  int originalPrice,
  int discountPrice,
  String sizeSwimmingPool,
  String status,
) {
  return Stack(
    children: [
      Padding(
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.021),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.49,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorConst.white,
              boxShadow: [
                BoxShadow(
                  color: ColorConst.shodowColor.withOpacity(0.5),
                  spreadRadius: 10,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: CachedNetworkImage(
                      imageUrl: imagePath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Divider(thickness: 3, color: ColorConst.containerBackground),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.035),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: classicText(text, size: FontConst.meduimFont),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),
                    classicText(sizeSwimmingPool,
                        color: ColorConst.textColor,
                        fontWeight: FontWeight.normal,
                        size: FontConst.meduimFont - 2),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013),
                    classicText(
                      "$originalPrice  ${"currency_name".tr()}",
                      decoration: TextDecoration.lineThrough,
                      color: ColorConst.salePriceColor,
                      size: FontConst.smallFont,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.005),
                    classicText(
                      "$discountPrice ${"currency_name".tr()}",
                      color: ColorConst.accentColor,
                      size: FontConst.meduimFont - 2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.017),
              Center(child: elevatedButtonMeduim(context, "order".tr(), () {}))
            ],
          ),
        ),
      ),
      Positioned(
        top: 16,
        left: 9,
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * 0.037,
          width: MediaQuery.of(context).size.width * 0.28,
          decoration: BoxDecoration(
            color: status == "?????? ????????????"
                ? ColorConst.statusPopular
                : status == "??????????????"
                    ? ColorConst.statusNew
                    : ColorConst.statusDiscount,
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