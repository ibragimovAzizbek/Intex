import 'package:flutter/material.dart';
import 'package:intex/core/widgets/classic_text.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.27,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: ColorConst.containerBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(path),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.012),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.045),
          child: classicText(title, size: FontConst.meduimFont),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Padding(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.045),
          child: classicText(
            subtitle,
            size: FontConst.meduimFont - 2,
            color: ColorConst.textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
