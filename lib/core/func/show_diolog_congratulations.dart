import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intex/core/components/eleveted_button.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:lottie/lottie.dart';

import '../constants/color_const.dart';

congratulationsDiolog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        icon: IconButton(
          icon: Image.asset('assets/icons/baseColorX.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconPadding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.8,
            top: MediaQuery.of(context).size.height * 0.01),
        content: SizedBox(
          height: 250,
          width: 362,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.1,
                child: LottieBuilder.asset('assets/anim/checkAnimation.json'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              classicText('congratulations'.tr(), color: ColorConst.textColor),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              SizedBox(
                width: 312,
                child: Text(
                  textAlign: TextAlign.center,
                  'congratulationsSubtitle'.tr(),
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: FontConst.meduimFont - 2,
                    color: ColorConst.textColor,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.018),
              elevatedButtonBig(
                context,
                'ok'.tr(),
                () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        insetPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01),
      ),
    );
