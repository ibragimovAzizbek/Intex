import 'package:flutter/material.dart';

import '../constants/color_const.dart';

TextFormField textFormFIled(String hintText, TextEditingController controller) {
  return TextFormField(
    controller: controller,
    keyboardType: TextInputType.name,
    textInputAction: TextInputAction.next,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: ColorConst.backgroundColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: ColorConst.backgroundColor,
          style: BorderStyle.none,
        ),
      ),
    ),
  );
}
