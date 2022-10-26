import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intex/core/base/base_api.dart';
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
  String status,
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
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.h * 0.057),
            Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: FontConst.meduimFont,
                  color: ColorConst.primaryColor,
                ),
              ),
            ),
            SizedBox(height: context.h * 0.016),
            SizedBox(
              height: context.h * 0.16,
              width: context.w * 0.5,
              child: CachedNetworkImage(
                  imageUrl: "${BaseApi.baseApiImage}$imagePath"),
            ),
            SizedBox(height: context.h * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "$originalPrice  ${"currency_name".tr()}",
                      style: TextStyle(
                        color: ColorConst.salePriceColor,
                        decoration: TextDecoration.lineThrough,
                        decorationColor: ColorConst.saleLineColor,
                        decorationThickness: 3,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: context.h * 0.005),
                    Text(
                      "$discountPrice  ${"currency_name".tr()}",
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
                      "order".tr(),
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
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(17),
            ),
            color: status == "recommended".tr()
                ? ColorConst.recommendColor
                : ColorConst.primaryAmber,
          ),
          child: Text(
            status,
            style: const TextStyle(color: ColorConst.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      // Positioned(
      //   right: context.w * 0.1,
      //   top: context.h * 0.15,
      //   child: SizedBox(
      //     height: context.h * 0.06,
      //     child: Image.asset(
      //       'assets/images/rowline.png',
      //     ),
      //   ),
      // ),
      // Positioned(
      //   right: context.w * 0.1,
      //   bottom: context.h * 0.1,
      //   child: SizedBox(
      //     width: context.w * 0.5,
      //     child: Image.asset(
      //       'assets/images/columnLine.png',
      //     ),
      //   ),
      // ),
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