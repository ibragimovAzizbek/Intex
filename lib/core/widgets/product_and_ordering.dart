import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/core/widgets/text_form_filed.dart';
import 'package:intex/cubit/home/home_cubit.dart';
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
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        icon: IconButton(
                          icon: Image.asset('assets/icons/cancel.png'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        iconPadding: EdgeInsets.only(left: context.w * 0.7),
                        backgroundColor: ColorConst.backgroundColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        content: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                width: context.w * 0.8,
                                height: context.h * 0.2,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(35),
                                    topRight: Radius.circular(35),
                                    bottomRight: Radius.circular(35),
                                  ),
                                  color: ColorConst.white,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    classicText(text,
                                        color: ColorConst.primaryColor),
                                    Image.asset(
                                        'assets/images/bassen.png'), // ! MASULAT RASIMI BECK-END'dan keladi
                                  ],
                                ),
                              ),
                              SizedBox(height: context.h * 0.02),
                              Center(
                                child: classicText(
                                    '1.390.000 сум'), // ! MASULAT NARXI BECK-END'dan keladi
                              ),
                              SizedBox(height: context.h * 0.01),
                              Form(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: context.h * 0.048,
                                      width: context.w * 0.8,
                                      child: textFormFIled(
                                        "Ваше имя",
                                        context
                                            .watch<HomeCubit>()
                                            .nameController,
                                      ),
                                    ),
                                    SizedBox(height: context.h * 0.01),
                                    SizedBox(
                                      height: context.h * 0.048,
                                      width: context.w * 0.8,
                                      child: textFormFIled(
                                        "Ваш номер",
                                        context
                                            .watch<HomeCubit>()
                                            .phoneNumberController,
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                    SizedBox(height: context.h * 0.01),
                                    Row(
                                      children: [
                                        SizedBox(
                                          height: context.h * 0.048,
                                          width: context.w * 0.5,
                                          child: textFormFIled(
                                            "Ваш адрес",
                                            context
                                                .watch<HomeCubit>()
                                                .nameController,
                                            keyboardType:
                                                TextInputType.streetAddress,
                                          ),
                                        ),
                                        IconButton(
                                          iconSize: context.w * 0.15,
                                          icon: SizedBox(
                                            height: context.h * 0.048,
                                            width: context.w * 0.4,
                                            child: Image.asset(
                                              'assets/icons/location.png',
                                              fit: BoxFit.cover,
                                              width: context.w * 0.2,
                                            ),
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorConst.primaryAmber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: classicText("Заказать"),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
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
