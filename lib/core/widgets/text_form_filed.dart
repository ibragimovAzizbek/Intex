import 'package:flutter/material.dart';

import '../constants/color_const.dart';

Container textFormFIled(
  String hintText,
  TextEditingController controller, {
  TextInputType keyboardType = TextInputType.name,
  Color color = ColorConst.backgroundColor,
}) {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(left: 12),
    decoration: BoxDecoration(
      border: Border.all(color: const Color(0xFFCBCBCB)),
      borderRadius: BorderRadius.circular(10),
      color: color,
    ),
    child: TextFormField(
      style: const TextStyle(fontWeight: FontWeight.bold),
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
      ),
    ),
  );
}
