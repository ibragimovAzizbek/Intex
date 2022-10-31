import 'package:flutter/material.dart';
import 'package:intex/core/widgets/classic_text.dart';
import 'package:intex/extensions/mq_extension.dart';

import '../constants/color_const.dart';
import '../constants/font_const.dart';

class WhyChouseUs extends StatelessWidget {
  String path;
  String title;
  String subtitle;
  WhyChouseUs({
    Key? key,
    required this.path,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.w * 0.035),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: context.h * 0.27,
            width: context.w * 0.9,
            decoration: BoxDecoration(
              color: ColorConst.containerBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(path),
          ),
          SizedBox(height: context.h * 0.012),
          classicText(title, size: FontConst.meduimFont),
          SizedBox(height: context.h * 0.01),
          classicText(
            subtitle,
            size: FontConst.meduimFont - 2,
            color: ColorConst.textColor,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
