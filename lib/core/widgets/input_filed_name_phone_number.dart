// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../constants/color_const.dart';
import '../constants/font_const.dart';
import 'classic_text.dart';

class NameAndPhonenumberInputFiled extends StatelessWidget {
  double width;
  NameAndPhonenumberInputFiled({Key? key, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          classicText("name".tr(), size: FontConst.meduimFont),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width * width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextFormField(
              cursorColor: ColorConst.grey,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "inputFiledName".tr(),
                hintStyle: TextStyle(color: ColorConst.skyDarck),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConst.textformBorderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          classicText("phoneNumber".tr(), size: FontConst.meduimFont),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          SizedBox(
            width: MediaQuery.of(context).size.width * width,
            height: MediaQuery.of(context).size.height * 0.06,
            child: TextFormField(
              keyboardType: TextInputType.number,
              cursorColor: ColorConst.grey,
              decoration: InputDecoration(
                prefixIcon: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.013,
                        left: MediaQuery.of(context).size.width * 0.017),
                    child: Wrap(
                      children: [
                        SizedBox(
                          width: 22,
                          height: 16,
                          child: Image.asset('assets/icons/flagUz.png'),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.015),
                        SizedBox(
                          width: 40,
                          height: 16,
                          child: classicText(
                            "+998 ",
                            color: ColorConst.inkBaseColor,
                            size: FontConst.meduimFont,
                          ),
                        ),
                        // SizedBox(child: Icon(Icons.align),)
                      ],
                    ),
                  ),
                ),
                hintText: "(90) 123 45 67",
                hintStyle: TextStyle(color: ColorConst.skyDarck),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorConst.textformBorderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        ],
      ),
    );
  }
}
