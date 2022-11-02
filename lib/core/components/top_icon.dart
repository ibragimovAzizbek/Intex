import 'package:flutter/material.dart';

IconButton topIconButton(
  BuildContext context,
  String path,
  Function function,
) {
  return IconButton(
    icon: SizedBox(
      width: MediaQuery.of(context).size.width * 0.25,
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
