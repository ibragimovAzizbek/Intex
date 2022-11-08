// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intex/cubit/home/home_cubit.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
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
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.032),
      child: Form(
        key: context.watch<HomeCubit>().formKey,
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
                controller: context.watch<HomeCubit>().nameController,
                cursorColor: ColorConst.grey,
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: "inputFiledName".tr(),
                  hintStyle: TextStyle(color: ColorConst.skyDarck),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConst.textformBorderColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'name_error'.tr();
                  }
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            classicText("phoneNumber".tr(), size: FontConst.meduimFont),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            SizedBox(
              width: MediaQuery.of(context).size.width * width,
              height: MediaQuery.of(context).size.height * 0.06,
              child: TextFormField(
                controller: context.watch<HomeCubit>().phoneNumberController,
                keyboardType: TextInputType.number,
                cursorColor: ColorConst.grey,
                textInputAction: TextInputAction.next,
                inputFormatters: [
                  MaskTextInputFormatter(
                    mask: "(##) ###-##-##",
                    filter: {"#": RegExp(r'[0-9]')},
                  ),
                ],
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
                        ],
                      ),
                    ),
                  ),
                  hintText: "(90) 123 45 67",
                  hintStyle: TextStyle(color: ColorConst.skyDarck),
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: ColorConst.textformBorderColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value!.length != 14 || value == null) {
                    return 'phone_error'.tr();
                  }
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
