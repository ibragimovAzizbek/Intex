import 'package:flutter/material.dart';
import 'package:intex/extensions/mq_extension.dart';

IconButton topIconButton(
  BuildContext context,
  String path,
  Function function,
) {
  return IconButton(
    icon: SizedBox(
      width: context.w * 0.2,
      child: Image.asset(
        path,
        fit: BoxFit.cover,
      ),
    ),
    onPressed: () {
      function();
    },
  );
}
