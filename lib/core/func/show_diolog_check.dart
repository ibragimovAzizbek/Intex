import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intex/core/constants/font_const.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/extensions/mq_extension.dart';
import 'package:lottie/lottie.dart';

import '../constants/color_const.dart';

checkAlertDiolog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorConst.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: IconButton(
          icon: Image.asset('assets/icons/cancel.png'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconPadding: EdgeInsets.only(left: context.w * 0.7),
        title: LottieBuilder.asset('assets/anim/checkAnimation.json'),
        content: SizedBox(
          height: context.h * 0.15,
          child: Column(
            children: [
              classicText("thank".tr(), size: 40),
              SizedBox(height: context.h * 0.02),
              Text(
                "your_time".tr(),
                style: TextStyle(
                  fontSize: FontConst.meduimFont + 2,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
